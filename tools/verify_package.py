#!/usr/bin/env python3
"""檢查 alleypin-pinfriends 安裝包（zip）能不能被正常安裝、使用。

用法：python3 tools/verify_package.py <zip> [--max-files 150] [--max-mb 20]
任何一項不通過就印出原因並 exit 1。

檢查項目：
 1. zip 最上層只有一個資料夾，名稱等於 skill 名稱（claude.ai 上傳要求）
 2. SKILL.md frontmatter：name 規格、description 長度與內容（官方規格）
 3. 檔案數、未壓縮總大小（安裝功能有 200 檔硬上限）
 4. 沒有夾帶維護者檔案（tools/、docs/、MAINTAINING.md、.git、.DS_Store）
 5. 文件裡沒有寫死某台電腦的路徑（/Users/、~/Desktop）
 6. 文件裡提到的參考圖、references 檔，在包裡都找得到；七隻角色的四面圖與表情表都在
 7. 每張 PNG 都是有效的 PNG
 8. characters.md 有七隻角色＋畫風＋情緒的英文區塊
"""
import argparse, re, sys, zipfile

NAME = "alleypin-pinfriends"
CHAR_BLOCKS = ["Style:", "Emotion:", "SHANDOU", "TUSI", "SHUIKE", "YIJI", "RUIBI", "BOTI", "SHIZI"]

ap = argparse.ArgumentParser()
ap.add_argument("zip")
ap.add_argument("--max-files", type=int, default=150)
ap.add_argument("--max-mb", type=float, default=20)
a = ap.parse_args()

errors, notes = [], []
z = zipfile.ZipFile(a.zip)
infos = [i for i in z.infolist() if not i.is_dir()]
names = [i.filename for i in infos]

# 1. 最上層
tops = {n.split("/")[0] for n in z.namelist()}
if tops != {NAME}:
    errors.append(f"zip 最上層應該只有 {NAME}/，實際是 {sorted(tops)}")
rel = {n[len(NAME) + 1:]: n for n in names if n.startswith(NAME + "/")}

# 2. frontmatter
if "SKILL.md" not in rel:
    errors.append("缺少 SKILL.md")
    skill = ""
else:
    skill = z.read(rel["SKILL.md"]).decode("utf-8")
    m = re.match(r"^---\n(.*?)\n---\n", skill, re.S)
    if not m:
        errors.append("SKILL.md 開頭沒有 YAML frontmatter")
    else:
        fm = m.group(1)
        name = (re.search(r"^name:\s*(.+)$", fm, re.M) or [None, ""])[1].strip()
        desc = (re.search(r"^description:\s*(.+)$", fm, re.M) or [None, ""])[1].strip()
        if name != NAME:
            errors.append(f"frontmatter name「{name}」跟資料夾名稱「{NAME}」不一致")
        if not re.fullmatch(r"[a-z0-9-]{1,64}", name) or re.search(r"anthropic|claude", name):
            errors.append(f"name「{name}」不符官方規格（小寫英數與連字號、64 字內、不能含 anthropic／claude）")
        if not desc:
            errors.append("description 是空的")
        if len(desc) > 1024:
            errors.append(f"description {len(desc)} 字，超過官方上限 1024")
        if re.search(r"<[^>]+>", desc):
            errors.append("description 不能含 XML 標籤")
        notes.append(f"description {len(desc)} 字（上限 1024）")

# 3. 檔數、大小
total = sum(i.file_size for i in infos)
if len(infos) > a.max_files:
    errors.append(f"檔案 {len(infos)} 個，超過紅線 {a.max_files}（安裝功能實測上限 200）")
if total > a.max_mb * 1024 * 1024:
    errors.append(f"未壓縮 {total/1048576:.1f} MB，超過紅線 {a.max_mb} MB")
notes.append(f"檔案 {len(infos)} 個（紅線 {a.max_files}）、未壓縮 {total/1048576:.1f} MB（紅線 {a.max_mb} MB）")

# 4. 維護者檔案
bad = [r for r in rel if r.startswith(("tools/", "docs/", ".git")) or r == "MAINTAINING.md" or r.endswith(".DS_Store")]
if bad:
    errors.append(f"夾帶了維護者檔案：{bad}")

# 5. 寫死路徑
mds = {r: z.read(n).decode("utf-8") for r, n in rel.items() if r.endswith(".md")}
for r, t in mds.items():
    for i, line in enumerate(t.split("\n"), 1):
        if re.search(r"/Users/|~/Desktop", line):
            errors.append(f"{r}:{i} 寫死了本機路徑：{line.strip()[:80]}")

# 6. 參考檔案都找得到
slugs = re.findall(r"\|\s*[^|]+\|\s*`([a-z]+)`\s*\|", skill)
if len(slugs) != 7:
    errors.append(f"SKILL.md 速查表應該有 7 個 slug，讀到 {slugs}")
for s in slugs:
    for kind in ("turnaround", "sheet"):
        if f"assets/ref/{s}-{kind}.png" not in rel:
            errors.append(f"缺少 assets/ref/{s}-{kind}.png")
for r, t in mds.items():
    for p in set(re.findall(r"(assets/ref/[A-Za-z0-9_-]+\.png|references/[A-Za-z0-9_.-]+\.md)", t)):
        if p not in rel:
            errors.append(f"{r} 提到 {p}，但包裡沒有")
    for p in set(re.findall(r"`([a-z]+(?:-[a-z]+)*\.png)`", t)):
        if f"assets/ref/{p}" not in rel:
            errors.append(f"{r} 提到 {p}，但 assets/ref/ 裡沒有")

# 7. PNG
for r, n in rel.items():
    if r.endswith(".png") and z.read(n)[:8] != b"\x89PNG\r\n\x1a\n":
        errors.append(f"{r} 不是有效的 PNG")

# 8. 英文區塊
chars = mds.get("references/characters.md", "")
blocks = re.findall(r"```text\n(.*?)```", chars, re.S)
for k in CHAR_BLOCKS:
    if not any(b.startswith(k) for b in blocks):
        errors.append(f"characters.md 少了「{k}」英文區塊")

for n in notes:
    print("・" + n)
if errors:
    for e in errors:
        print("✗ " + e)
    sys.exit(1)
print(f"✓ 8 項檢查全部通過（{a.zip}）")
