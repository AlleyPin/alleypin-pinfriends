# 維護說明（維護者用，不進安裝包）

維護者：Hsing。repo：`AlleyPin/alleypin-pinfriends`（私人）。

## 檔案分工

| 路徑 | 給誰 | 進安裝包？ |
|---|---|---|
| `SKILL.md` | AI 讀的主文件：流程、守則、各工具的用法 | ✅ |
| `安裝教學.md` | 同事看的安裝步驟 | ✅ |
| `references/characters.md` | 七隻角色的詳細規格與英文 prompt 區塊 | ✅ |
| `assets/ref/` | 從設計稿轉出來的參考圖（17 張） | ✅ |
| `docs/test-log.md` | 每次實測的原始紀錄 | ❌ |
| `tools/` | 重產參考圖、打包、檢查的腳本 | ❌ |
| `MAINTAINING.md` | 本檔 | ❌ |

## 改了東西之後的發佈流程

1. 改檔。
2. 打包並檢查：`bash tools/release.sh`。預設輸出到 `~/Desktop/AlleyPin/AlleyPin Claude/alleypin-pinfriends 安裝包/alleypin-pinfriends_日期.zip`。
   - 腳本會跑 `tools/verify_package.py` 的 8 項檢查，任何一項不過就刪掉壞包並 exit 1。
3. 有改 `安裝教學.md` 的話，更新開頭的版本日期。
4. commit（訊息寫這次防什麼坑）→ push。
5. 把新的 zip 發給同事，或交給 Claude 管理員重新派發。

## 檔數紅線

Claude 的 skill 安裝功能（上傳 zip／貼 GitHub 網址）有 **200 檔硬上限**。2026-07-15 簡報 skill 被同事實測撞到；官方文件沒有寫。`verify_package.py` 設的紅線是 150。目前安裝包只有 20 個檔，要大量加參考圖之前，先想想是不是能合併成一張總表。

## 設計稿改版時

1. 拿到新版《IP 視圖.ai》（目前放在 `~/Desktop/AlleyPin/Claude 用社群品牌規範文件/IP 視圖.ai`）。
2. `bash tools/build_refs.sh [新的 .ai 路徑]`，重產 `assets/ref/` 全部參考圖。需要 macOS（swiftc、CoreGraphics）和 ImageMagick 7。
3. 腳本裡的裁切座標是依 2026-10-02 版的排版量的。排版有大幅移動時，要先打開 `assets/ref/full-sheet.png` 重新量座標，否則會裁到旁邊的角色。
4. 色票、身高比例有變的話，同步改 `SKILL.md` 速查表和 `references/characters.md`。

## 實測紀錄怎麼寫

- 原始紀錄（日期、測了什麼、成品路徑、數字）寫進 `docs/test-log.md`，新的寫在最上面。
- 從紀錄裡歸納出「對所有人都有用」的規則，另外整理進 `SKILL.md` 的「生圖守則」。不要把整段紀錄貼進 SKILL.md：那會讓每個同事每次都多讀一大段，而且會帶出內部專案細節。

## Hsing 電腦上的安裝方式

skill 本體在 `~/Desktop/Claude Skills/alleypin-pinfriends/`，用符號連結裝進：
- `~/.claude/skills/alleypin-pinfriends`（Claude Code）
- `~/.codex/skills/alleypin-pinfriends`（Codex；2026-10-05 實測 CLI 0.154 讀得到。官方文件寫的個人路徑是 `~/.agents/skills/`）

桌面資料夾改名或搬動，這兩個連結會無聲失效。
