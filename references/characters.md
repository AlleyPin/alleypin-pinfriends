# PinFriends 七隻角色外型規格

> 來源：AlleyPin 設計稿《IP 視圖.ai》（2026-10-02 版，維護者保管）。
> 顏色是 2026-10-05 從向量圖渲染後實際取樣的 hex，不是目測。身高比例是四面圖正面在同一比例尺下實測。
> 物種與「吐司」的正式寫法由 Hsing 2026-10-05 確認；其餘標「推測」的項目設計稿沒寫，未經確認。

## 目錄
- [全員共通畫風](#全員共通畫風)
- [身高與體型對照](#身高與體型對照)
- [山豆](#山豆shandou)
- [吐司](#吐司tusi)
- [水可](#水可shuike)
- [伊吉](#伊吉yiji)
- [瑞比](#瑞比ruibi)
- [波提](#波提boti)
- [石子](#石子shizi)
- [設計稿裡出現過的服裝與道具](#設計稿裡出現過的服裝與道具)

---

## 全員共通畫風

- 平面 2D、向量感的卡通。**近黑色描邊**（#171918 左右），中等偏細、同一隻角色全身粗細一致、線頭圓角。例外：石子的線明顯較粗；吐司和伊吉的嘴與腳用橘色描邊。
- **純色平塗**：沒有漸層、沒有材質、沒有 3D 光影、沒有投影。例外只有平塗的白色反光：石子的球體、波提的泡泡。
- 輪廓簡單、圓胖、腿短，**多數沒有脖子**（山豆、吐司、伊吉的頭和身體是同一個輪廓）。
- 五官極小、位置偏高：眼睛多半是兩個小點或兩條短直線，中性表情平靜、偏冷面。
- 表情靠「小符號」加上去：粉紅腮紅橢圓、淡藍汗滴、黃色閃光、紅色「!!」、問號、音符、速度線。
- 整體以柔和、低彩度的顏色為主；伊吉的黑白與石子的紅是比較重的點綴色。場景道具用同一套畫風：淡藍櫃檯（#B7DAE4）、淺灰電腦與螢幕（#E5E4DF）。

可直接貼進 prompt 的英文版：

```text
Style: AlleyPin "PinFriends" mascot style. Flat 2D vector-like cartoon, clean near-black outlines (#171918), medium-thin and consistent line weight with rounded ends (only the tiny red ball Shizi uses a bolder line), flat solid color fills, no gradients, no textures, no 3D shading, no drop shadows. Chunky simple silhouettes, stubby limbs, mostly no neck. Tiny minimal facial features placed high on the face (dot or short-dash eyes) for a calm, deadpan, cute look. Expressions only through small flat marks: pink blush ovals, light-blue sweat drops, yellow sparkles, red "!!", question marks, music notes. Soft, muted palette overall; Yiji's black-and-white and Shizi's red are the bolder accents.
```

### 情緒怎麼畫：不靠嘴，靠輔助元素

原則（Hsing 2026-10-05）：山豆沒有嘴巴，其他角色的嘴也極小，所以**情緒靠眼睛、腮紅、周邊符號和肢體**營造，不靠嘴形。需求裡寫「大笑」「超開心」時，要翻譯成下表的手法，不要叫模型畫笑嘴。

| 情緒 | 設計稿用過的手法 | 出處 |
|---|---|---|
| 開心、滿足 | 眼睛變成閉合短弧線、粉紅腮紅 | 山豆表情格 |
| 喜歡、心動 | 粉紅愛心眼 | 山豆表情格 |
| 得意、好消息 | 頭部周圍的黃色四角閃光 | 山豆表情格 |
| 雀躍 | 粉紅小花團＋腮紅＋挑眉 | 山豆表情格 |
| 歡呼 | 雙手高舉（拿金幣）、單腳抬起踢腿跳舞 | 山豆動作 |
| 輕鬆愉快 | 音符；閉眼搖晃加速度線 | 素材庫檔名「吐司哼歌愉快」「吐司閉眼搖晃自得」 |
| 開心到跳起來 | 跳躍＋冒愛心 | 素材庫檔名「吐司開心跳躍冒愛心」 |
| 加油、自信 | 握拳；舉旗 | 素材庫檔名「吐司握拳加油打氣」「吐司自信舉旗」 |
| 讚、喜愛 | 比讚；抱愛心 | 素材庫檔名「伊吉比讚讚」「伊吉抱愛心」 |

「出處」寫素材庫檔名的，我只看了檔名，沒有逐張開圖確認畫法。

唯一例外：山豆表情格裡有一格「驚訝」畫了張開的嘴（在口鼻部下緣、下巴線上方）。除了驚訝，都不畫嘴。

```text
Emotion: show feelings WITHOUT mouths. Shandou has no mouth at all, and the other characters keep their tiny neutral mouths. Express joy with closed happy arc eyes or heart eyes, pink blush ovals, yellow four-point sparkles, small hearts, music notes or pink flower puffs around the head, and joyful body language (both arms raised, a little hop, one leg kicked up, swaying with motion lines). Never draw a smiling, grinning or laughing mouth.
```

---

## 身高與體型對照

對照圖：`assets/ref/lineup.png`（七隻同比例並排、站在同一條基準線上）。

| 角色 | 身高（山豆＝100） | 寬高比（含手臂） | 體型一句話 |
|---|---|---|---|
| 山豆 | 100 | 0.69 | 最高也最壯，上窄下寬的葫蘆／鐘形 |
| 吐司 | 89 | 0.69（身體本身 0.48） | 瘦高，吐司切片般的直筒膠囊 |
| 瑞比 | 80 | 0.67 | 大頭（約佔身高一半），身體短 |
| 水可 | 79 | 0.64 | 頭最大（約 58%），下面接小小的梨形身體 |
| 伊吉 | 78 | 0.67 | 梨形，底部最寬 |
| 波提 | 38 | 0.75 | 矮胖，鬃毛佔上半部 |
| 石子 | 27 | 球體直徑約佔身高 72% | 迷你紅球，火柴棒手腳 |

身高含耳朵（山豆）、頭頂盤子（水可）、耳機頭帶（伊吉）。

**誤差提醒**：高矮的「順序」可信；百分比是四面圖的量測值。設計稿「角色們」區穿白袍的那一排（粗量，只量了一個場景），吐司約為山豆的 98%、伊吉約 86%，比四面圖的差距小。生成多角色場景時，順序一定要對，百分比可以有大約 ±10% 的彈性。

---

## 山豆（shandou）

素材庫與社群模板稱「山豆醫師」，在設計稿的合照場景裡常穿白袍。

- 參考圖：`assets/ref/shandou-turnaround.png`（正、側前、側、背）、`assets/ref/shandou-sheet.png`（表情與動作）
- 物種：熊（圓耳、口鼻部、背後短尾）。Hsing 過去的 prompt 也寫 bear。
- **輪廓**：頭和身體是同一個高圓頂、沒有脖子；上窄、往臀部變寬，像葫蘆或鐘。身體寬約為身高的 0.55 倍（含手臂 0.68 倍）。
- **顏色**：身體 `#D2E2E3`（淡藍灰）；耳朵、鼻子、尾巴 `#57ABBE`（藍綠）；口鼻部與胸口記號是純白。
- **臉**：位置偏高，在從頭頂往下約 15%–30% 的範圍；兩條很短的直線眼睛、一個白色橢圓口鼻部，上面頂著藍綠色小豆形鼻子。
- **嘴巴**：**山豆沒有嘴巴**（Hsing 2026-10-05 確認）。口鼻部下方那條淺弧線是**下巴線**，不是嘴。證據有兩個：驚訝表情裡張開的嘴畫在口鼻部和這條線「之間」，弧線依然在；側面圖這條線是從臉的輪廓延伸出來的下巴。表情格裡，開心靠眼睛和腮紅表現，不畫笑嘴；只有驚訝時，才在口鼻部下緣畫一個張開的嘴（深色口腔加舌頭），位置在下巴線上方。
- **胸口記號**：白色平塗的「M／雙峰」形（兩個尖峰、中間一個凹口、兩翼往外下方延伸）。這是山豆最好認的招牌。
- **四肢**：長而軟的手臂垂在身側，垂到身高約 2/3 處；腿短，約佔身高底部 1/5，腳掌圓。
- **背面**：一顆藍綠色圓形小尾巴。
- **耳朵**：兩個小半圓、整片藍綠色，**沒有內耳顏色**。

QA 必查三點：①頭身同一輪廓沒脖子 ②胸口白色 M 形、平塗 ③耳朵整片藍綠、無內耳。

```text
SHANDOU (山豆) — a pale blue-gray bear. Head and body form ONE continuous tall rounded dome with no neck, narrow at the top and widening toward the hips like a gourd or bell; body width about 0.55x its height. Body fill #D2E2E3. Two small half-circle ears in solid teal #57ABBE at the top corners, no inner-ear color. Face sits high (roughly 15%-30% down from the top of the head): two tiny short vertical-dash eyes, a white oval muzzle with a small teal bean-shaped nose on top of it. NO visible mouth in neutral or happy expressions; the short shallow curved line below the muzzle is the CHIN line, not a mouth, so never turn it into a smile or draw a mouth on or inside the muzzle. Happiness is shown only with the eyes and pink blush. Only for surprise, a small open mouth (dark inside with a tongue) hangs from the bottom edge of the muzzle, between the muzzle and the chin line. Signature mark on the chest: a flat pure-white "M" / double-peak chevron (two small peaks with a notch between them, the two wings sloping down and outward), no gradient, no transparency. Long soft arms hang along the sides to about two-thirds down the body. Short stubby legs (bottom fifth of the height) with rounded feet. A small round teal tail on the back. Calm, deadpan expression.
```

---

## 吐司（tusi）

> 名稱：正式寫法是「吐司」（Hsing 2026-10-05 確認）。`IP 視圖.ai` 的區塊標題寫「土司」，指的是同一隻。

- 參考圖：`assets/ref/tusi-turnaround.png`、`assets/ref/tusi-sheet.png`
- 物種：鴨子（Hsing 2026-10-05 確認）。身體輪廓就是一片吐司：圓頂、兩側幾乎垂直、底部圓。
- **輪廓**：直筒膠囊形，身體寬約為身高的 0.48 倍；身體佔身高 84%，腿佔 16%。
- **顏色**：身體純白 `#FFFFFE`＋黑色描邊；嘴與腳是芥末黃 `#E0D46E`，**描邊是橘色 `#D9A154` 不是黑色**。
- **臉**：位置在上方 1/3。兩條很短的直線眼睛；**只有一邊眉毛**：一條斜線在它的右眼上方（畫面左邊），往中間往下斜，形成冷面、狐疑的表情。這是吐司的招牌。
- **嘴**：寬扁的鴨嘴，上面有兩個小鼻孔點，下方一個小小的圓形下嘴喙。嘴寬約為身體寬度的 1/3。
- **四肢**：小小的圓翅膀在身體中段兩側；兩根細直的黃色腿，小蹼足往外撇。
- 沒有尾巴、沒有頭髮、沒有羽毛紋理。

QA 必查三點：①吐司切片般的直筒輪廓 ②單邊斜眉 ③黃嘴黃腳配橘色描邊。

```text
TUSI (吐司) — a white duck with a flat duck bill whose body is shaped like a slice of toast bread (not a realistic duck: no neck, no feathers, no curved duck body): a tall capsule with a domed top, nearly straight vertical sides and a rounded bottom; body width about half its height. Pure white fill #FFFFFE with a near-black outline. Face in the upper third: two tiny short vertical-dash eyes and ONE single slanted eyebrow line above its right eye (viewer's left), sloping down toward the center, giving a deadpan skeptical look. A wide flat mustard-yellow duck bill (#E0D46E) with a thin ORANGE outline (#D9A154, not black), two tiny nostril dots on top and a small rounded lower bill. Small rounded wing-arms at mid-body. Two thin straight mustard-yellow stick legs with small webbed feet pointing outward, also outlined in orange. No tail, no hair, no feather texture.
```

---

## 水可（shuike）

- 參考圖：`assets/ref/shuike-turnaround.png`、`assets/ref/shuike-sheet.png`
- 物種：河童風格（推測，信心高：頭頂盤子＋頭髮＋鳥嘴；「水可」拼起來是「河」）。**背面沒有龜殼**。
- **輪廓**：頭最大、是全身最寬的地方，含盤子約佔身高 58%；下面接小一號的梨形身體（寬約為頭寬的 0.7 倍）；底部一雙小黃靴腳。
- **顏色**：身體 `#84C59D`（鼠尾草綠）；頭髮 `#58AD93`（深一階的綠）；盤子 `#EDD052`（黃，邊緣深一階）；嘴與腳 `#D8E05D`（黃綠）。
- **頭頂**：扁平的黃色橢圓盤子，坐在一圈深綠色鋸齒狀頭髮上；頭髮最外側兩個尖角稍微往左右翹出頭的輪廓。
- **臉**：兩個極小的黑點眼睛、間距很寬；一個小小的黃色菱形嘴，中間一條橫線（閉著的鳥嘴），黑色描邊。
- **手**：只用肚子上兩條勾狀的線表示，沒有獨立畫出來的手臂。

QA 必查三點：①大頭小身 ②頭頂黃盤＋鋸齒深綠髮 ③菱形小黃嘴、無龜殼。

```text
SHUIKE (水可) — a green kappa-style creature. Big round head that is the widest part of the body (about 58% of the total height including the plate), with a smaller pear-shaped body below it (about 0.7x the head width) and tiny yellow boot-like feet. Body fill sage green #84C59D. On top of the head: a flat yellow oval plate (#EDD052 with a slightly darker yellow rim) sitting in a crown of darker green zigzag hair (#58AD93) whose two outer tips poke out sideways. Face: two tiny black dot eyes set wide apart, and a small yellow-green diamond-shaped closed beak (#D8E05D) split by one horizontal line, black outline. Arms are drawn only as two curled hook lines on the belly. No turtle shell, no webbed hands, no scales, no extra hair.
```

---

## 伊吉（yiji）

- 參考圖：`assets/ref/yiji-turnaround.png`、`assets/ref/yiji-sheet.png`
- 物種：企鵝。
- **輪廓**：梨形，底部最寬；頭部約佔身高 47%。
- **顏色**：黑色 `#171918`；白色 `#FFFFFE`；耳機 `#345293`（深海軍藍）；耳罩墊 `#DC853D`（橘）；嘴與腳 `#DBD06D`（芥末黃），描邊橘色。
- **臉**：白色心形臉（頂部兩個圓弧、中間一個小凹口），往下連到白色肚子。兩個圓黑點眼睛（比山豆、吐司、水可的眼睛大）；小小的圓角黃嘴，裡面一條小微笑線。
- **耳機**：細頭帶繞過頭頂，兩側是圓形海軍藍耳罩，內側露出橘色耳墊，耳罩會凸出頭的輪廓。
- **四肢**：黑色長鰭垂在身側；小黃腳。

QA 必查三點：①心形白臉 ②海軍藍耳機＋橘耳墊 ③嘴小。

```text
YIJI (伊吉) — a black-and-white penguin wearing headphones. Pear-shaped body, widest near the bottom; black head and back (#171918). A white heart-shaped face patch (two rounded lobes at the top with a small notch in the middle) that continues down into a white belly. Two round black dot eyes. A SMALL rounded mustard-yellow beak (#DBD06D) with an orange outline (#DC853D) and a tiny smile line inside. Deep navy headphones (#345293, not bright royal blue): a thin headband over the top of the head and round navy ear cups with orange ear pads (#DC853D) on both sides, the cups sticking out past the head outline. Long black flippers hanging at the sides. Small mustard-yellow feet with orange outlines.
```

---

## 瑞比（ruibi）

- 參考圖：`assets/ref/ruibi-turnaround.png`、`assets/ref/ruibi-sheet.png`
- 物種：兔子（Hsing 2026-10-05 確認）。是**垂耳兔**：耳朵往下垂在臉頰兩側，不是直立的長耳。
- **輪廓**：大圓頭約佔身高一半；身體短、略為下寬；腿短。
- **顏色**：身體與頭純白 `#FFFFFE`；耳尖、腿、尾巴 `#61BAB2`（藍綠）；領巾 `#D9C960`（芥末黃）；口鼻圈 `#C4E4DF`（淡薄荷）；鼻子 `#63B7DB`（天藍）。
- **頭**：長長的垂耳垂到臉頰高度，每隻耳朵下半部外側是藍綠色（上白下藍綠的雙色耳）；額頭一條波浪狀捲毛瀏海線。
- **臉**：兩個大黑點眼睛、間距寬；一個淡薄荷色的圓形口鼻圈，裡面一顆天藍小鼻子和一個小「v」嘴。
- **領巾**：芥末黃三角領巾，前面是三角形，背後打結、有兩個小尾巴。
- **四肢**：白色手臂垂在身側；腿是藍綠色，像短褲＋圓腳；背後一顆藍綠色圓尾巴。

QA 必查三點：①雙色垂耳 ②芥末黃三角領巾 ③淡薄荷口鼻圈＋天藍小鼻。

```text
RUIBI (瑞比) — a white lop-eared rabbit. The ears hang DOWN beside the cheeks; never draw upright rabbit ears, buck teeth or whiskers. Large round white head (about half of the total height) with long floppy ears hanging down to cheek level; the lower outer half of each ear is teal #61BAB2, the upper part white. A wavy curly fringe line on the forehead. Two big black dot eyes set wide apart. A pale mint circular muzzle patch (#C4E4DF) containing a tiny sky-blue nose (#63B7DB) and a small "v" mouth. A mustard-yellow triangular bandana (#D9C960) around the neck, knotted at the back with two small tails. Short white body with white arms hanging at the sides; teal legs (#61BAB2) like short pants with rounded feet. A round teal pom tail on the back. Body fill #FFFFFE, near-black outline.
```

---

## 波提（boti）

- 參考圖：`assets/ref/boti-turnaround.png`、`assets/ref/boti-sheet.png`
- 物種：獅子（Hsing 2026-10-05 確認）。咖啡色那團是**鬃毛**，畫成三團雲朵般的圓形毛球，不是寫實的放射狀鬃毛；尾巴是一顆奶油色小圓球，不是細長、末端一撮毛的獅子尾。
- **輪廓**：矮胖。正面是圓角豆形；側面是長長的四腳麵包形。上方約 45% 是鬃毛，鬃毛是全身最寬的地方。
- **顏色**：身體 `#EC9456`（橘）；鬃毛 `#A06E5C`（咖啡）；口鼻 `#FFFFFE`；鼻子 `#93CFC4`（薄荷）；尾巴與泡泡 `#F5D2A3`（奶油色）。
- **鬃毛**：三團圓形毛球疊在一起（中間那團最高），前面一排圓弧瀏海。
- **臉**：兩條粗短的橫線眼皮加小睫毛（半閉、很享受的瞇瞇眼）；一個小白色橢圓口鼻，上面一顆薄荷色鼻子。
- **四肢**：極短的圓腳（側面看得到四隻）；奶油色圓尾巴。
- **常駐道具（選用）**：側面與背面圖都有幾顆奶油色泡泡（帶白色反光）飄在背後。

QA 必查三點：①三團咖啡鬃毛 ②瞇瞇眼 ③四腳短胖、體型只有山豆的四成。

```text
BOTI (波提) — a tiny chubby orange lion cub, drawn very simply. Body fill orange #EC9456: a rounded bean shape from the front, a long low four-legged loaf from the side. The top ~45% is its brown mane (#A06E5C), shaped like a fluffy cloud of three overlapping round puffs (the middle one highest) with a scalloped fringe over the forehead; the mane is the widest part of the character. Not a realistic lion: no radiating spiky mane, no visible ears, no whiskers, no claws, no long tail with a tuft. Sleepy, content face: two short thick horizontal eyelid lines with tiny lashes (eyes half-closed), and a small white oval muzzle with a mint nose (#93CFC4) on top. Tiny stubby round legs (four visible from the side). A small cream round tail (#F5D2A3). Optional: a few cream bubbles (#F5D2A3 with a white highlight) floating near its back. Only about 0.38x as tall as Shandou.
```

---

## 石子（shizi）

- 參考圖：`assets/ref/shizi-turnaround.png`、`assets/ref/shizi-sheet.png`
- 物種：紅色小球（非動物）。
- **輪廓**：正圓球身體，直徑約佔身高 72%；下方 28% 是腿。
- **顏色**：身體 `#DC614D`（紅橘）；眼白 `#FFFFFE`；描邊與手腳 `#020604`（黑）。
- **眼睛**：兩個直立的膠囊形大白眼，粗黑描邊、小直條黑瞳孔；左右並排、互相貼住，位置在球的左上方（3/4 側面時會稍微凸出球的輪廓）。
- **反光**：球的右上方一條白色短弧線加一個白點（亮面球）。
- **四肢**：粗黑火柴棒線條；手臂從兩側伸出（招牌姿勢是一手揮手）；兩根直腿，腳底小小往外撇。
- 中性表情沒有嘴。
- 描邊和火柴棒手腳很粗：在 `lineup.png` 的同比例下，石子的線明顯比其他角色粗。

QA 必查三點：①膠囊大白眼並排 ②球體白色反光 ③火柴棒手腳、體型極小（約山豆的 1/4）。

```text
SHIZI (石子) — a tiny red ball creature (not an animal). A perfect circle body (#DC614D) with a glossy white highlight on the upper right (one short curved white stroke plus a white dot). Two tall pill-shaped white eyes with thick black outlines and small vertical black pupils, side by side and touching, placed on the upper-left area of the circle (they may slightly break the circle outline). Limbs are thick black stick lines: thin arms from the sides (often one arm waving), two straight stick legs with tiny outward foot ticks. No mouth in the neutral pose. Thick black outline. Very small: only about 0.27x as tall as Shandou, small enough to sit inside a soup bowl held in Shandou's paw.
```

---

## 設計稿裡出現過的服裝與道具

`assets/ref/group-scenes.png`（設計稿「角色們」區）出現過的造型，要畫角色穿衣服或在場景裡時拿這張當參考：

- **白袍**：白色醫師袍、描邊是細的藍灰色（不是黑色），內搭淡藍襯衫＋領帶。穿過的有山豆、吐司。
- **口罩**：薄荷綠或淡藍醫療口罩（山豆、吐司、伊吉）。
- **西裝**：灰色西裝（瑞比、水可）。
- **紅色領結**：吐司。
- **手術帽與手術服**：淡薄荷色（吐司、瑞比）。
- **場景**：淡藍櫃檯、淺灰桌機、手機、伺服器圖示、Podcast 麥克風、咖啡廳。
- **品牌元素**：1.Talk 螢幕畫面、LINE 與 Google 圖示。要畫品牌 logo 時，用公司品牌規範的正式 logo 檔另外合成，不要讓模型自己畫字。
