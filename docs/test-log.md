# PinFriends 生圖實測紀錄（維護者用）

> 這個檔只給維護者看，**不會打包進給同事的安裝包**。每次實測的原始紀錄寫在這裡；從紀錄裡歸納出來、對所有人都有用的規則，要另外整理進 `SKILL.md` 的「生圖守則」。
> 2026-10-06 從 SKILL.md 搬過來，內容未改。新紀錄請加在最上面。

**2026-10-06 動畫試做 EP01（四）MG 畫風重測：換成正確的吐司參考圖，另加一組只靠文字**：接續下面（三）。以下路徑都在 `~/Desktop/AlleyPin/PinFriends/動畫試做/04_生圖/` 底下。兩組各生兩版、各約 3 分鐘；實際下的指令（含 `-i` 附了哪些檔）存在 `prompts/G1v3_G1v4_指令.txt`，這次之後都要存。
- G1v3（正確參考圖）：prompt 跟 G1v2 只差輸出檔名，Image 2 換成 `ref/MG_吐司_畫風參考_v2.png`（團體照最左邊那隻吐司，380×413，只有上半身）。兩張都沒有黑描邊，近黑像素 823、651 個，都是眼睛和眉毛（#202020 左右）；單邊斜眉、黃嘴黃腳配橘描邊、空白灰卡正面不傾斜都對，透明背景有保留。下半身比四面圖略寬，MG 原圖的吐司也是上窄下寬。
- G1v4（只靠文字，模擬同事手上沒有 MG 圖）：拿掉 MG 參考圖，只附四面圖和舉旗姿勢圖，Style 第一句改成「match the AlleyPin MG explainer-video look exactly」。兩張也都沒有黑描邊（近黑像素 0），QA 三點都過，下半身一樣略寬；差別是眼睛眉毛變成深藍灰（#385060～#445864），不是黑色。
- 結論：MG 做法在吐司身上成立，附不附截圖都能去掉黑描邊，差在眼睛顏色。已把 G1v4 的 Style 原句加進 characters.md「另一套畫風：MG 介紹片」，註明只測過山豆、吐司；SKILL.md「寫 prompt 的幾個重點」加一行指過去。
- MG 畫風的灰卡一樣好抓：最大相連那塊以外的灰點，G1v3 是 91、84 個，G1v4 是 35、52 個。
- 舉旗姿勢圖是 `~/Desktop/AlleyPin/Claude 用社群品牌規範文件/視覺素材/IP場景/ip-吐司自信舉旗.png`（這次的指令檔可查；G1v2 附的是不是同一張，紀錄裡查不到）。
- prompt：`prompts/G1v3_吐司舉卡_MG_正確參考.txt`、`prompts/G1v4_吐司舉卡_MG_純文字.txt`；成品：`G1v3_tusi_card_a/b.png`、`G1v4_tusi_card_a/b.png`。

**2026-10-06 動畫試做 EP01（一）拿設計師現成姿勢，只加白袍**：山豆白袍站姿、抱胸、糟糕了三題，各用 `codex exec` 生兩版（1024×1536、透明底），6 張全部一次過 QA 三點，也都沒有畫出嘴。胸口 M 被白袍遮住，照 SKILL.md 生圖守則 6 不算走樣。以下動畫試做的檔案都在 `~/Desktop/AlleyPin/PinFriends/動畫試做/` 底下。
- 參考圖分工：Image 1 是本 skill 的 `assets/ref/shandou-turnaround.png`，用來認臉。Image 2 是 saleskit 的山豆白袍舉卡圖（`05_角色素材/社群_山豆_白袍舉Nova卡_saleskit.png`），寫明「ONLY for the coat, tie and line weight; do NOT copy its pose, the card it holds, or its background」，6 張都沒抄到舉卡姿勢、卡片或背景。
- Image 3 依題目換：「糟糕了」那題附設計師 IP 場景圖「山豆醫師糟糕了」，寫「keep this exact pose, expression, sweat drops and line style; only add the coat」；抱胸那題附一張山豆抱胸圖，只當姿勢參考（寫明不抄圓形背景與線條）；站姿是新姿勢，只附前兩張。
- 社群畫風的白袍本身是細藍灰線，只有熊的頭、身體、手腳是黑描邊。prompt 另寫一段 OUTFIT 把兩種線分開交代：「white coat whose outlines are thin blue-gray (NOT black)」「The bear's own body, head, ears and arms keep the normal near-black outline」，6 張都照做。
- 實測色（各張出現最多的顏色）：身體 #CEDFE0～#D3E2E4（色票 #D2E2E3），耳朵 #4CA2BC～#5AAEC6（色票 #57ABBE）。
- prompt：`04_生圖/prompts/` 的 `G3B_山豆白袍站姿.txt`、`G4_山豆白袍抱胸.txt`、`G5_山豆白袍糟糕了.txt`，Codex 完整紀錄是同資料夾的 `*_codex_log.txt`；成品是 `04_生圖/` 的 `G3B_*`、`G4_*`、`G5_*`。

**2026-10-06 動畫試做 EP01（二）有字的物件先畫灰卡，事後換正式卡面**：角色要拿正式卡片、logo 這類有字的東西時，讓 Codex 畫「純灰 #808080、正面不傾斜的空白圓角卡」（prompt 原句：plain rounded rectangle in solid mid-gray #808080 … facing the viewer FLAT (no perspective, no tilt) … the card must be completely blank gray），再用程式換成正式卡面。路徑同上，都在 `~/Desktop/AlleyPin/PinFriends/動畫試做/` 底下。
- 工具：`tools/card_swap.swift`（用法 `card_swap 角色圖 卡面 輸出`）。程式找「最大一塊相連的灰色區域」當卡片，依它的外框把卡面縮放貼上；翅膀壓在卡上的部分不是灰色，會保留下來。程式不做透視變形，所以卡片一定要正面、不傾斜。
- 為什麼要找「最大相連」：黑描邊和白身體交界的抗鋸齒像素剛好是中灰，也會通過灰色門檻。實測 `G1_tusi_card_a.png`：符合門檻的像素有 32,607 個、散成 582 塊；最大一塊（卡片）31,712 個，其餘 895 個分散在 581 個小塊，全部貼著黑描邊（2px 內）。只用門檻抓，外框是 750×829，幾乎是整隻吐司（758×1027）；找最大相連，外框是 239×148，剛好是卡片。
- 無黑描邊的 MG 畫風（G1v2 兩張）散落的灰點只有 84、47 個。
- 成品：`05_角色素材/生圖_吐司_舉Nova卡.png`（`04_生圖/G1_tusi_card_a.png` 換上 `06_品牌素材/Nova卡面_saleskit.png`）。prompt：`04_生圖/prompts/G1_吐司舉卡.txt`。

**2026-10-06 動畫試做 EP01（三）畫風有兩套；MG 畫風初試（只有兩題，未充分實測）**：路徑同上，都在 `~/Desktop/AlleyPin/PinFriends/動畫試做/` 底下。
- 社群畫風：設計師 73 張 IP 場景圖和 saleskit 都是近黑描邊，也就是 skill 現在「全員共通畫風」寫的那套。
- MG 畫風：YouTube 上 1.Talk、AI Agent、Nova 三支 MG 介紹片（抽格在 `01_素材盤點/`）沒有黑描邊，角色靠填色分出形狀，白色角色和白袍只有細的淺灰藍線（約 #A9BFC4）。兩套並排的對照圖：`04_生圖/畫風比較_MG對社群.png`。
- 試法：整段 Style 換掉，開頭寫「Style (overrides any default mascot style): … WITHOUT near-black outlines … white characters and white clothing get only a thin light blue-gray outline (about #A9BFC4), never black」；Image 1 四面圖註明「Use it for identity ONLY, not for line style」；Image 2 附 MG 原圖當畫風參考。
- 結果：吐司舉卡（G1v2）、山豆白袍站姿（G3）各兩版，4 張都沒長出黑描邊。近黑像素只有 188～514 個，都是眼睛、眉毛這類五官；同題的社群畫風 `G1_tusi_card_a.png` 是 20,145 個，白袍三姿勢 6 張是 22,572～30,552 個。
- 吐司的畫風參考圖裁錯了：`04_生圖/ref/MG_吐司_畫風參考.png`（330×430）是從 `05_角色素材/MG_山豆吐司_團體照_D-C11-3.png` 的 x≈500 處裁下來的（逐像素比對，平均差 0.003），裡面只有山豆舉起的半截袖子，沒有吐司。所以吐司那題的 MG 線條，多半是文字帶出來的（推論）。Codex 紀錄沒寫 `-i` 附了哪些檔，「這張就是 G1v2 的 Image 2」是從 prompt 的描述和檔案時間推定的。
- 要小心：只有兩題，其中一題的畫風參考還是錯的；認臉用的四面圖本身是黑描邊，長期用要留意會不會飄回黑線。正式採用前，先換一張真的吐司 MG 圖重測，再多測幾隻角色。可以考慮在 characters.md 加一段 MG 畫風英文區塊，並註明未充分實測（這次還沒加）。
- prompt：`04_生圖/prompts/G1v2_吐司舉卡_MG.txt`、`04_生圖/prompts/G3_山豆白袍站姿_MG.txt`；畫風參考圖在 `04_生圖/ref/`。

**2026-10-06 第 2 版（Claude 網頁版改為不適用）＋Release v2026.10.06.2**：Hsing 指出網頁版自己不能生圖，原本「寫 prompt 叫同事去 ChatGPT 貼」那條路從沒測過，不該列成可用。改完重驗三條下載路：固定連結拿到的與本機打包檔 SHA-256 相同，8 項全過，安裝教學已是第 2 版；git clone 資料夾名稱正確、內容已更新；Download ZIP 仍是 `-main`（README 有警告）。

**2026-10-06 改公開＋發 Release v2026.10.06 後，驗三條同事下載路（未登入、從外部）**：
- 路 1，README 固定連結 `releases/latest/download/alleypin-pinfriends.zip`：HTTP 200，下載檔與本機打包檔 SHA-256 相同，`verify_package.py` 8 項全過。
- 路 2，綠色 Code → Download ZIP：資料夾是 `alleypin-pinfriends-main/`，與 skill 名稱不一致，改不了。README 頂端與 Release 說明都有警告，請大家用路 1。
- 路 3，`git clone https://github.com/AlleyPin/alleypin-pinfriends.git`：資料夾是 `alleypin-pinfriends`，SKILL.md name 一致，17 張參考圖都在。
- 教訓：上一版只驗了自己打的 zip，沒走 GitHub 下載這條路，被 Hsing 抓到。之後每次發版都要照 MAINTAINING.md 第 6 步驗三條路。
- 還沒驗：Claude 網頁版實際上傳 zip。

**2026-10-06 模擬全新安裝驗收（Codex 當收件人）**：用 `tools/release.sh` 打的安裝包（20 檔、4.7 MB），解壓到乾淨測試資料夾的 `.agents/skills/`；測試期間把 Hsing 電腦上 `~/.codex/skills/alleypin-pinfriends` 連結移出 skills 資料夾，確保 Codex 只看得到安裝包那份，跑完立刻放回。
- 輸入同事會打的原句：「幫我生一張伊吉拿著手機、開心比讚的圖，透明背景，存成 ./yiji-thumbsup.png」，沒有任何提示。
- Codex 自己載入安裝包裡的 SKILL.md 與 characters.md，照「你是 Codex」那條路：用 `view_image` 打開安裝包裡的 `yiji-turnaround.png`、`yiji-sheet.png`，再用內建 image_gen 生成；沒有去呼叫 `codex exec`。約 2 分鐘。
- 成品 QA：心形白臉、海軍藍耳機（實測 #345396，色票 #345293）、橘耳墊（#E28934）、嘴小都對；透明背景有保留（四角 alpha 0）。鰭上長拇指比讚不算走樣：設計師原圖「伊吉比讚讚」也這樣畫。
- 副作用觀察：Hsing 的 Codex 裝了很多 skill，啟動時提示「skill 描述被縮短以符合預算」。同事電腦 skill 少，應該不受影響（推論）。
- 反向測試：故意塞入寫死路徑、刪一張參考圖、加到 179 檔、把 name 改成不合規格，`release.sh` 都 exit 1、不留壞包。
- 成品：`~/Desktop/Claude Skills/alleypin-pinfriends-workspace/fresh-install-2026-10-06/yiji-thumbsup.png`，Codex 完整紀錄在同資料夾 `codex.jsonl`。
- 沒測到：Claude 網頁版上傳 zip（要在使用者的帳號介面操作）、Claude Code 從安裝包安裝（結構與 Hsing 電腦上用的同一份，只差維護者檔案）。

**2026-10-05 驗收測試（用本 skill 的參考圖包＋英文區塊）**：山豆、瑞比、石子三隻並排揮手，第一次生成就合格。
- 每隻角色的「QA 必查三點」都通過。瑞比和石子在素材庫裡沒有任何現成圖，只靠四面圖加文字就畫對了。
- 實測高矮：瑞比是山豆的 75.6%（目標 80），石子 27.9%（目標 27）。
- 成品：`~/Desktop/Claude Skills/alleypin-pinfriends-workspace/test-2026-10-05/test-trio.png`，prompt 在同資料夾的 `prompt.txt`，可以當範本。

**2026-10-05 物種確認後的驗收測試**：Hsing 確認吐司是鴨子、瑞比是兔子、波提是獅子。物種寫進英文區塊時，同時列出不能出現的特徵（直立兔耳、寫實鬃毛、獅子長尾等），避免模型往一般的兔子、獅子拉。測試圖是吐司、瑞比、波提三隻同框，第一次生成就合格。
- 三隻的「QA 必查三點」都通過。瑞比的耳朵維持下垂、沒有暴牙或鬍鬚；波提的鬃毛維持三團雲朵狀，尾巴是奶油色小圓球。
- 實測高矮（吐司＝100）：瑞比 82%（目標 90），波提 47%（目標 43）。順序正確，誤差都在 ±10% 內。兩次測試裡，瑞比都比目標矮（75.6、82），可以留意。要嚴格比例時，可以試著在 prompt 裡把差距寫得更明確（未實測）。
- 成品：`~/Desktop/Claude Skills/alleypin-pinfriends-workspace/test-2026-10-05-species/test-species.png`

**2026-10-05「山豆大笑」壓力測試**：輸入同事最可能打的原句「幫我生山豆大笑」，看 skill 會不會把它翻譯成設計稿的開心手法，而且不畫嘴。第一次生成就合格。
- 翻譯：依「情緒怎麼畫」換成閉合的開心弧線眼、粉紅腮紅、黃色閃光、粉紅小愛心、雙手高舉、單腳抬起踢腿。參考圖附四面圖和表情動作表。
- 結果：放大檢查臉部，沒有嘴；口鼻部乾淨，下巴線維持淺弧線。開心的氣氛有出來。QA 必查三點都通過。小偏差：鼻子比設計稿略大。
- 成品：`~/Desktop/Claude Skills/alleypin-pinfriends-workspace/test-2026-10-05-joy/shandou-joy.png`
- 這次是 Claude 照 skill 翻譯好之後才交給 Codex。如果同事直接在 Codex 裡打「山豆大笑」，Codex 會不會自己載入這個 skill、自己做翻譯，還沒測過。

- 用本 skill 還沒測過：水可；側面與背面。

**2026-10-06 瑞比第一次進場景（替換 Cofit 第 4 段第 3 張的吐司）**：附原圖當 Image 1、只換左邊角色，一次出兩版，兩版都保住原構圖與山豆。QA 三點都過；瑞比身高 85%／78%（目標 80）。兩版領巾顏色差很多（#D7C467 vs #F4D473），同一份 prompt 的色準不穩，選圖時要實測取色。

**2026-10-05 Cofit webinar 第 3、4 段五張場景重出（山豆醫師＋伊吉／吐司，坐在桌後、3:2 透明底）**：兩次 `codex exec`（一次 2 張、一次 3 張，各約 3 分鐘），五張角色一次合格。
- 吐司第一次用本 skill 進場景：單邊斜眉、直筒輪廓、黃嘴橘描邊都對（skill 建立前的舊圖缺斜眉）。伊吉耳機 #325091／#315193（舊圖 #2346A2 亮寶藍），英文區塊的 navy 限制在場景圖也有效。
- 要讓整頁服裝一致：把定稿 KV 當 Image 1 附上，寫明「ONLY for Shandou's outfit, character look and line weight; do NOT copy its background shapes」，五張都只抄了白袍＋淡藍襯衫＋領帶，沒抄背景。
- 驗收注意：角色手臂、翅膀的內部線條起點在身體中間是**官方畫法**（吐司四面圖的翅膀就是兩端都不接的開放線），不要跟「路徑線頭尾要接上」混為一談。

**2026-10-05 Cofit webinar KV 第七、八輪（第六輪被退件後）**：幾何參考圖附了，Codex 就會「照抄」到連錯誤都一起抄——第六輪白線線頭停在圓柱內部、山豆白袍下襬平切浮在背景中間，兩個都是參考圖本身的問題。
- **參考圖出圖前先自己驗**：每條線的頭尾要落在徽章或形狀邊線上（或藏在前景形狀後面）；角色身體被切掉的地方，參考圖裡要有一個前景形狀擋在那裡。沒有擋的東西，模型只能平切。
- 線要「接在圓柱邊線上」最穩的做法：把線畫在那根圓柱**後面**，讓圓柱邊線把線切齊（第七輪三張全中）；提示詞同時寫「pillar is in FRONT of the path」與「a line end may never stop in empty space」。
- 角色腰部要被擋：把前排圓柱拉高到角色腰線，提示詞寫「a character's body may only be cut off by a shape in front of it」（第八輪三張都藏好，其中一張另有漸層光暈）。
- 驗收腳本：`landing page/2026-11-cofit-webinar/tools/qa_lines.py`（線頭前方顏色、白袍下緣接什麼）。

**2026-10-05 Cofit webinar KV 第六輪（山豆白袍＋伊吉＋幾何背景，透明底 3:2）**：同一份 prompt 跑三張，三張角色都合格。
- 參考圖依序：①程式畫的幾何版面參考圖（正圓、圓角拉到底的圓柱）②山豆四面圖 ③伊吉四面圖 ④lineup ⑤group-scenes（只拿白袍）。
- 伊吉改過耳機描述後首次驗證：耳機實測 #335092（設計稿 #345293），之前的亮寶藍問題沒再出現。
- 山豆穿白袍時胸口 M 記號會被白袍遮住，這是設計稿白袍造型本來就這樣，QA 時不要誤判成走樣。
- 透明背景：三張都有保留 alpha。
- **背景幾何要精確時，附一張程式畫的幾何參考圖，比只用文字有效**：同類構圖只靠文字描述時，墨綠圓邊緣平均偏離 2.4px；附參考圖之後是 0.5px。prompt 裡另外寫明可檢查的定義：圓「寬高相等」、圓角矩形「圓角半徑＝寬度一半，頂端是一個正半圓」。
- 成品與 prompt：`~/Desktop/AlleyPin/landing page/2026-11-cofit-webinar/assets/kv-drafts/r6/`（`prompt-1.txt`、`kv-r6-1.png`）。

**2026-10-05 Cofit webinar KV 草稿（skill 建立前）**：那一輪是拿素材庫的場景圖當參考圖（不是四面圖）生的。對照設計稿看到的偏差：
- **伊吉的耳機變成亮寶藍**（取樣 #2F50AF，設計稿 #345293 是深海軍藍），頭帶也畫得比較粗。
- **山豆胸口的白色 M 形記號**變大，還帶了半透明漸層；設計稿是小而平塗的純白。

characters.md 的英文區塊已經針對這幾點加了限制（navy, not bright royal blue／no gradient, no transparency）。加了限制之後伊吉還沒重生驗證過。之後每次發現新的走樣，都補進這一節和對應角色的英文區塊。
