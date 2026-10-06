#!/bin/bash
# 打包給同事安裝的 zip，並做發佈前檢查。
# 用法：bash tools/release.sh [輸出資料夾]
#   預設輸出到 ~/Desktop/AlleyPin/AlleyPin Claude/alleypin-pinfriends 安裝包/
#   產出兩份內容相同的 zip：留檔用的「_日期」版，以及上傳 GitHub Release 用的固定檔名版。
# 只打包白名單裡的東西：SKILL.md、安裝教學.md、references/、assets/ref/。
# tools/、docs/、MAINTAINING.md 是維護者用的，不進安裝包。
# 任何一項檢查失敗：刪掉剛打的 zip、印出原因、exit 1。
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NAME="alleypin-pinfriends"
OUT_DIR="${1:-$HOME/Desktop/AlleyPin/AlleyPin Claude/alleypin-pinfriends 安裝包}"
STAMP="$(date +%Y%m%d)"
ZIP="$OUT_DIR/${NAME}_${STAMP}.zip"
MAX_FILES=150          # 安裝功能實測有 200 檔硬上限（2026-07-15 簡報 skill 撞到），留安全邊際
MAX_MB=20              # API 上限 30 MB（未壓縮）；claude.ai 官方未公布上限，保守抓 20

fail() { echo "❌ 發佈中止：$1" >&2; rm -f "$ZIP"; exit 1; }

STAGE="$(mktemp -d)"; trap 'rm -rf "$STAGE"' EXIT
mkdir -p "$STAGE/$NAME" "$OUT_DIR"
cd "$SKILL_DIR"
for f in SKILL.md 安裝教學.md; do [ -f "$f" ] || fail "缺少 $f"; cp "$f" "$STAGE/$NAME/"; done
mkdir -p "$STAGE/$NAME/references" "$STAGE/$NAME/assets"
cp references/*.md "$STAGE/$NAME/references/"
cp -R assets/ref "$STAGE/$NAME/assets/"
find "$STAGE" -name '.DS_Store' -delete

rm -f "$ZIP"
(cd "$STAGE" && zip -qr -X "$ZIP" "$NAME")

# ---- 檢查 ----
python3 "$SKILL_DIR/tools/verify_package.py" "$ZIP" --max-files "$MAX_FILES" --max-mb "$MAX_MB" || fail "verify_package.py 沒通過（原因見上方）"

# GitHub Release 要上傳固定檔名的這份，README 與安裝教學的
# releases/latest/download/alleypin-pinfriends.zip 連結才會永遠指到最新版。
UPLOAD="$OUT_DIR/${NAME}.zip"
cp "$ZIP" "$UPLOAD"

echo "✅ 打包完成：$ZIP"
echo "   上傳 GitHub Release 用：$UPLOAD（檔名不要改）"
