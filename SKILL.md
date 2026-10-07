---
name: alleypin-pinfriends
description: AlleyPin 品牌 IP「PinFriends」七隻角色（山豆／山豆醫師、吐司（設計稿寫土司）、水可、伊吉、瑞比、波提、石子）的外型規格、精確色票、高矮胖瘦比例與參考圖包，用來叫 Codex imagegen（或任何生圖工具）畫出不走樣的角色圖。只要任務要「生成、畫、做」任何含這些角色的圖——KV、主視覺、社群首圖、貼圖、表情包、簡報插圖、landing page 角色、角色合照、新動作、新服裝——或使用者提到 PinFriends、AlleyPin IP、品牌吉祥物、山豆熊、鴨子吐司、兔子瑞比、獅子波提、企鵝伊吉、河童水可，就一定要先用這個 skill，即使他只說「幫我生一張山豆拿手機的圖」。也用在檢查生成出來的角色圖像不像、哪裡走樣。不適用：只是從現成素材庫挑一張既有 IP 圖（那是 alleypin-slide-design／social-post-generator 的素材庫工作）。
---

# AlleyPin PinFriends 角色生成

PinFriends 是 AlleyPin 的七隻品牌 IP 角色。這個 skill 讓 AI 生出來的角色圖，長相、顏色、高矮胖瘦都跟設計稿一致。內容分三塊：每隻角色的詳細規格（`references/characters.md`）、從設計稿轉出來的參考圖（`assets/ref/`），以及本檔的生圖流程與守則。

本檔提到的路徑，都是相對於**本 skill 資料夾**。載入 skill 時系統會告訴你它在哪；常見位置是 `~/.claude/skills/alleypin-pinfriends/`（Claude Code）或 `~/.agents/skills/alleypin-pinfriends/`（Codex）。

## 七隻速查

| 角色 | slug | 身高 | 主色 | 一眼認出的特徵 |
|---|---|---|---|---|
| 山豆（山豆醫師） | `shandou` | 100 | 淡藍灰 #D2E2E3＋藍綠 #57ABBE | 熊；頭身一體的高圓頂；胸口白色 M 形記號；沒有嘴巴 |
| 吐司（設計稿寫「土司」） | `tusi` | 89 | 白＋芥末黃 #E0D46E | 鴨子；吐司切片般的直筒輪廓；單邊斜眉；黃嘴黃腳配橘描邊 |
| 瑞比 | `ruibi` | 80 | 白＋藍綠 #61BAB2＋芥末黃 #D9C960 | 垂耳兔；雙色垂耳、三角領巾、薄荷色口鼻圈 |
| 水可 | `shuike` | 79 | 鼠尾草綠 #84C59D＋黃 #EDD052 | 河童；頭頂黃盤＋鋸齒髮；大頭小身 |
| 伊吉 | `yiji` | 78 | 黑白＋海軍藍 #345293＋橘 #DC853D | 企鵝；心形白臉；海軍藍耳機配橘耳墊 |
| 波提 | `boti` | 38 | 橘 #EC9456＋咖啡 #A06E5C | 獅子；三團雲朵狀咖啡色鬃毛、瞇瞇眼、四腳短胖 |
| 石子 | `shizi` | 27 | 紅橘 #DC614D | 紅色小球、膠囊形大白眼、火柴棒手腳 |

身高以山豆＝100，是設計稿四面圖在同一比例下實測的。高矮順序一定要對；合照時百分比可以有大約 ±10% 的彈性（原因見 characters.md）。

## 參考圖包（`assets/ref/`）

| 檔案 | 用途 |
|---|---|
| `<slug>-turnaround.png` | 該角色正、側前、側、背四面圖。**每次生圖都要附**，這是保住長相最有效的一張。 |
| `<slug>-sheet.png` | 該角色的表情格＋動作＋小場景。要特定表情或動作時加附。 |
| `lineup.png` | 七隻同比例並排的身高對照。**畫兩隻以上時必附**，並在 prompt 裡寫明它只用來對高矮。 |
| `group-scenes.png` | 設計稿的合照與場景（白袍、口罩、西裝、櫃檯、Podcast）。要穿衣服、進場景時附。 |
| `full-sheet.png` | 整張設計稿縮圖，給人看全貌用；生圖時通常不必附。 |

為什麼要附圖：只給文字，模型只能自己想像「淡藍色的熊」長怎樣。附四面圖等於直接給它看「就是這隻」，文字負責補圖上看不出來的：顏色 hex、比例、不能出現的東西。

## 先看你在哪個工具裡

| 你是… | 怎麼生圖 |
|---|---|
| **Codex**（ChatGPT 桌面 App 的 Codex、Codex CLI、IDE 擴充） | 自己生成。先用 `view_image` 打開要附的參考圖（本 skill 資料夾的 `assets/ref/…`），讓圖進到對話裡，再用內建的圖片生成工具照下面的模板生成。不要再去呼叫 `codex exec`。 |
| **Claude Code**，而且這台電腦裝了 Codex CLI 並已登入 | 照下面「用 Claude Code 叫 Codex」那一節，用 `codex exec` 附參考圖生成。 |
| **Claude 網頁版、Claude App 的一般對話**，或其他自己不能生圖的環境 | **不適用。** 這裡生不出圖，請直接告訴使用者：改用 Codex（ChatGPT 桌面 App）或 Claude Code（Claude App 的 Code 分頁也算）。不要改寫 prompt 叫使用者自己去別的工具貼。 |

## 生圖流程

1. **先找現成的。** 設計師已經畫好 73 張 IP 場景圖（只有山豆 35、吐司 25、伊吉 13，其他四隻沒有），alleypin-slide-design skill 的素材包（`assets/visual-assets.zip` 裡的 ip 資料夾）和社群素材庫的「視覺素材／IP場景」資料夾都有。手邊有的話先看有沒有合用的：設計師原圖不會走樣。
2. **決定角色、動作、用途**：用在哪（KV／貼圖／簡報）、比例（1:1、9:16）、要不要透明背景、要不要穿服裝。
3. **組參考圖**：每隻角色附 `-turnaround`；兩隻以上加 `lineup.png`；要特定表情或動作加 `-sheet`；要服裝或場景加 `group-scenes.png`。用不到的圖就不要附（推論，未實測）：每多一張圖，就多一件要在 prompt 裡交代的事，交代不清容易混淆。
4. **組 prompt**：照下面的模板。角色描述從 `references/characters.md` 複製該角色的英文區塊，不要自己改寫，因為那些字都是對照設計稿逐項寫的。
5. **生成**：照上面「先看你在哪個工具裡」的對應方式。
6. **QA**：對照每隻角色在 characters.md 的「QA 必查三點」逐項看，再檢查高矮順序。有問題就一次只改一件事重生，並在 prompt 裡重申沒問題的部分要保留。
7. **交件**：存到使用者指定的位置；沒指定就存在目前的工作資料夾。回報完整路徑。

## Prompt 模板

```text
IMPORTANT: pure image-generation task. Do not read any files or notes; use only the attached reference images and this text.

Use your built-in image generation tool to create ONE image and save it as ./<檔名>.png (keep original resolution).

Use case: illustration-story
Asset type: <用途，例如 landing page KV character cut-out / LINE sticker / slide illustration>
Input images:
- Image 1: <角色> turnaround model sheet — identity reference, match exactly
- Image 2: ...
- Image N: height lineup of all characters at the same scale — use ONLY for relative heights
Primary request: <誰、在做什麼、什麼表情、全身或半身、朝向>
Relative heights (critical): <例如 Shandou 100%, Yiji 78%>
Composition: <比例、背景（plain white / fully transparent）、留白、角色位置>

<貼「全員共通畫風」英文區塊>
<貼每隻角色的英文區塊>

Constraints: match the reference sheets exactly in silhouette, proportions, colors and line weight; flat fills only; no text, letters or logos; no extra characters.
```

寫 prompt 的幾個重點：
- 前兩行（「不要讀檔案」「用內建工具生成並存檔」）是給「把 prompt 交給另一個 Codex」時用的。你自己就是 Codex 時，這兩行可以省略。有些人的 Codex 全域指令會要求先讀筆記或知識庫，明寫「不要讀檔案」可以讓它直接生圖。
- 圖片要依序編號、寫明每張是哪隻角色、拿來做什麼（這是 Codex 內建 imagegen skill 的建議：reference images by index）。
- 透明背景要明講「fully transparent background, only the subject」。2026-10-05 實測，Codex 生成的圖有保留透明背景。
- 品牌 logo、文字不要讓模型畫，事後再用正式檔合成（做法見生圖守則 8）。
- 使用者要 YouTube MG 介紹片那種沒有黑描邊的畫風時，照 characters.md「另一套畫風：MG 介紹片」換掉 Style 區塊。這套只實測過山豆、吐司兩隻；沒指定就用預設的黑描邊。
- 需求裡有情緒（開心、大笑、興奮）時，先照 characters.md「情緒怎麼畫」翻譯成腮紅、閃光、愛心、肢體動作，再加貼那段英文 Emotion 區塊。山豆沒有嘴巴，描述想要的表情時不能用「laughing」「big smile」這類字。英文區塊裡這些字只出現在否定句（never draw a smiling mouth），實測沒有把模型帶偏（只測過一次）。

## 生圖守則（從實測歸納）

1. **參考圖要先自己驗過。** 模型會連參考圖裡的錯一起照抄。自己做版面參考圖時，每條線的頭尾都要落在形狀邊線上（或藏在前景形狀後面），角色身體被切掉的地方，前面要有一個形狀擋住；沒有東西擋，模型只能平切。
2. **要精確的幾何背景，附一張用程式畫的幾何參考圖**，比只寫文字準：實測圓的邊緣偏差從 2.4px 降到 0.5px。prompt 裡再寫可檢查的定義，例如圓「寬高相等」、圓角矩形「圓角半徑＝寬度一半」。
3. **穿服裝、要指定姿勢時，每張參考圖只管一件事**：四面圖認臉；一張穿著該服裝的定稿圖只拿服裝，寫明「ONLY for <角色>'s outfit and line weight; do NOT copy its pose, props or background」；要用設計師現成的姿勢或表情，再附那張原圖，寫明「keep this exact pose and expression; only add the outfit」。實測兩批共 11 張都只抄了服裝：五張場景圖沒抄到背景，山豆白袍三種姿勢 6 張也沒抄到服裝參考圖裡的舉卡姿勢和卡片。
4. **只換其中一隻角色或局部**：附原圖當 Image 1，寫明只換哪裡、其他全部保持不變。
5. **同一份 prompt，每張的顏色會飄。** 實測同一份 prompt 生兩張，瑞比的領巾一張 #D7C467、一張 #F4D473（色票 #D9C960）。重要用途多生幾張，實際取色挑最接近色票的。
6. **驗收時別誤判兩件事**：手臂、翅膀的內部線條兩端不接，是設計稿本來的畫法；山豆穿白袍時，胸口 M 記號被白袍遮住，也是設計稿本來就這樣。
7. **一次只改一件事。** 重生時只改一個問題，並重申其他沒問題的部分要保留。
8. **有字的物件（卡片、招牌、logo）先畫灰卡**：讓模型畫純灰 #808080、正面不傾斜的空白圓角卡，prompt 寫明「the card must be completely blank gray」，事後用程式換成正式圖。抓灰色要取「最大一塊相連的灰色區域」：黑描邊和白色身體交界的抗鋸齒剛好也是中灰，只用顏色門檻抓，範圍會撐到整隻角色（實測 750×829，卡片其實只有 239×148）。卡片要正面不傾斜，事後才能直接縮放貼上，不用算透視。

## 用 Claude Code 叫 Codex

在輸出資料夾執行（`-C` 指到那裡，Codex 才能把圖存進去）：

```bash
REF="<本 skill 資料夾>/assets/ref"
codex exec --skip-git-repo-check -s workspace-write -C "<輸出資料夾>" "$(cat prompt.txt)" \
  -i "$REF/shandou-turnaround.png" -i "$REF/yiji-turnaround.png" -i "$REF/lineup.png"
```

- prompt 放在 `-i` **前面**（2026-10-05 實測可行的寫法）。`-i <FILE>...` 可以一次接多個檔案，prompt 放在後面有可能被當成圖檔路徑（未實測，照實測過的寫法就好）。
- `-i` 的順序就是 prompt 裡 Image 1、2、3 的順序。
- 原圖存在 `~/.codex/generated_images/<session>/exec-*.png`，Codex 會再複製一份到輸出資料夾。
- 實測速度：一張圖、四張參考圖，從下指令到出圖約 1 分鐘；一次生三張約 3 分鐘。
- 一次 `codex exec` 可以生多張：在 prompt 裡寫清楚每張的檔名就好。

## 維護

設計稿改版、重產參考圖、打包發佈的流程，寫在 GitHub repo `AlleyPin/alleypin-pinfriends` 的 `MAINTAINING.md`（不在安裝包裡）。維護者：Hsing。用起來發現新的走樣或好用的寫法，請回報給維護者，整理進「生圖守則」。
