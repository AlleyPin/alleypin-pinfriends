#!/bin/bash
# 從 IP 視圖.ai 重產 assets/ref/ 的參考圖。
# 用法：bash tools/build_refs.sh [IP 視圖.ai 路徑]
# 需求：macOS（swiftc、CoreGraphics）＋ ImageMagick 7（magick）。
# 座標單位：以 2 px/pt 渲染整頁（1683×1603）時的像素座標，依 2026-10-02 版排版量測。
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
AI="${1:-$HOME/Desktop/AlleyPin/Claude 用社群品牌規範文件/IP 視圖.ai}"
OUT="$SKILL_DIR/assets/ref"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

FONT="$HOME/Library/Fonts/AdobeFanHeitiStd-Bold.otf"
[ -f "$FONT" ] || FONT="/System/Library/Fonts/STHeiti Medium.ttc"

cp "$AI" "$TMP/ip.pdf"   # .ai 內含 PDF 相容層
swiftc -O "$SKILL_DIR/tools/region.swift" -o "$TMP/region"
R() { "$TMP/region" "$TMP/ip.pdf" "$@" >/dev/null; }
mkdir -p "$OUT"

# 整頁
R "$OUT/full-sheet.png" 2 0 0 1683 1603

# 四面圖：slug scale x0 y0 x1 y1
while read -r slug s x0 y0 x1 y1; do
  R "$TMP/t.png" "$s" "$x0" "$y0" "$x1" "$y1"
  magick "$TMP/t.png" -fuzz 2% -trim +repage -bordercolor white -border 60 "$OUT/$slug-turnaround.png"
done <<'EOF'
shandou 22 262 200 432 272
tusi 22 698 192 852 252
shuike 22 1092 192 1252 252
yiji 22 1528 186 1666 242
ruibi 22 232 735 372 798
boti 30 615 750 728 790
shizi 34 958 662 1080 690
EOF

# 表情與動作區
while read -r slug x0 y0 x1 y1; do
  R "$TMP/s.png" 8 "$x0" "$y0" "$x1" "$y1"
  magick "$TMP/s.png" -fuzz 2% -trim +repage -bordercolor white -border 40 "$OUT/$slug-sheet.png"
done <<'EOF'
shandou 40 180 435 590
tusi 525 180 860 530
shuike 955 180 1250 490
yiji 1340 180 1665 390
ruibi 35 720 375 1000
boti 460 715 735 850
shizi 830 700 1090 905
EOF

# 角色們（合照與場景）
R "$TMP/g.png" 6 40 1120 1600 1560
magick "$TMP/g.png" -fuzz 2% -trim +repage -bordercolor white -border 40 -resize 2600x "$OUT/group-scenes.png"

# 身高對照：各角色正面在同一比例尺下渲染，底部對齊
H0=0; cells=()
while read -r slug name x0 y0 x1 y1; do
  R "$TMP/fv_$slug.png" 24 "$x0" "$y0" "$x1" "$y1"
  magick "$TMP/fv_$slug.png" -fuzz 2% -trim +repage "$TMP/fv_$slug.png"
  h=$(magick identify -format '%h' "$TMP/fv_$slug.png"); [ "$H0" -eq 0 ] && H0=$h
  echo "$slug $name $h" >> "$TMP/heights.txt"
done <<'EOF'
shandou 山豆 262 200 307 272
tusi 吐司 698 192 739 252
ruibi 瑞比 232 735 273 798
shuike 水可 1092 192 1130 252
yiji 伊吉 1528 186 1564 242
boti 波提 615 750 640 790
shizi 石子 962 666 978 688
EOF
while read -r slug name h; do
  pct=$(( (h * 100 + H0 / 2) / H0 ))
  w=$(magick identify -format '%w' "$TMP/fv_$slug.png"); cw=$(( w > 300 ? w + 80 : 380 ))
  magick -size "${cw}x$((H0 + 40))" xc:white "$TMP/fv_$slug.png" -gravity south -composite \
    \( -size "${cw}x150" xc:white -font "$FONT" -fill '#222' -pointsize 54 -gravity north -annotate +0+18 "$name" \
       -fill '#777' -pointsize 34 -annotate +0+90 "身高 ${pct}%" \) -append "$TMP/cell_$slug.png"
  cells+=("$TMP/cell_$slug.png")
done < "$TMP/heights.txt"
magick "${cells[@]}" +append -bordercolor white -border 40 "$TMP/row.png"
W=$(magick identify -format '%w' "$TMP/row.png")
magick "$TMP/row.png" -stroke '#bbbbbb' -strokewidth 3 -draw "line 40,$((H0 + 80)) $((W - 40)),$((H0 + 80))" \
  \( -size "${W}x120" xc:white -font "$FONT" -fill '#222' -pointsize 46 -gravity northwest \
     -annotate +50+30 "PinFriends 身高對照（四面圖正面同比例實測，山豆＝100%，含耳朵／頭頂盤子／耳機）" \) \
  +swap -append +repage -depth 8 "$OUT/lineup.png"

cat "$TMP/heights.txt"
echo "完成：$OUT"
