; 剧本选择画面

*start|
@history output=false enabled=false
@rclick enabled=true jump=true target=*start storage="mainmenu.ks"
@laycount layers=0 messages=0

; base  | 背景
; 0-1   | 各Scenario特有的标题图
; 2     | 标题 
; 3     | 下部说明栏
; 4     | 选单底图
; 5     | 暂停效果使用的截图
; 6     | 确认选单底图
@laycount layers=7 messages=3

; 进入动画
@image storage="../bgimage/bg.png" layer=base visible="true" opacity=0
@image storage="../others/Title.png" layer=2  left=1046 top=36 opacity=150 visible="true" 
@animstart layer=2 seg=1 target="*start1"
@image layer=4 storage="../others/menu_frame.png"  left=-444 top=129 visible="true" opacity=150"
@image storage="../others/msg_return.png" layer=3 left=100 top=667 opacity=0 visible="true" 
@move layer=base time=500 path=(,,255)
@move layer=4 time=100 delay=100 path=(72,129,255)
@move layer=2 time=200 path=(74,36,255) accel=2
@move layer=3 time=200 delay=300 path=(100,640,255)
@wm

; 剧本选择菜单说明文字层设定
@current layer="message1" 
@position layer=message1 left=120 top=420 width=429 visible="true"
@deffont size="18" 
@defstyle fade=false
@resetfont

*scenario_list| 显示选项
@position layer=message0 left=120 top=150 visible="true"
@current layer="message0" 
@deffont 
@nowait
[link color=0xff884e onenter="kageval('[scn1_onenter]')" onleave="kageval('[scn_onleave]')" exp="tf.scn = 'A'" storage="scenarioSelect.ks" target=*confirm_dia]
Scenario A  星月宫篇             [endlink][r]
[link color=0xff884e onenter="kageval('[scn2_onenter]')" onleave="kageval('[scn_onleave]')" exp="tf.scn = 'B'" storage="scenarioSelect.ks" target=*confirm_dia]
Scenario B  暗黑宫篇             [endlink][r]
[link color=0xff884e]
？？？                           [endlink][r]
[link color=0xff884e]
？？？                           [endlink][r]
[link color=0xff884e]
？？？                           [endlink][r]
[link color=0xff884e]
？？？                           [endlink][r]
@endnowait
@s

*confirm_dia| 确认画面
@eval exp="dm(tf.scn)"

;停止动画和move
@animstop layer=2 seg=1
@eval exp="f.pausedMove = true"

;截图并清空文字
@locksnapshot
@current layer="message1" 
@cm

;读取截图
@layopt layer="5" visible="true" top=0 left=0 
@eval exp="kag.fore.layers[5].assignImages(kag.snapshotLayer)"
@eval exp="kag.fore.layers[5].setSizeToImageSize()"
@pimage layer=5 storage="../others/bg_dark.png"

; TODO: 显示确认窗口
@waitclick

@freeimage layer="5" 
@eval exp="f.pausedMove = false"
@current layer="message0" 
@er
@unlocksnapshot
@animstart layer=2 seg=1 target="*resume1"
@jump target="*scenario_list"