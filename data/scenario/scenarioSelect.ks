; 剧本选择画面

*start|
@history output=false enabled=false
@rclick enabled=true jump=true target=*start storage="mainmenu.ks"

; 1,2用来显示各Scenario特有的标题图
; 0,3,4分别是背景、标题、和系统说明栏
; message0显示剧本列表，message1显示说明文
@laycount layers=5

; 切换黑底
@image storage="../bgimage/black.png" layer=base visible="true" 

; 进入动画
@image storage="../others/bg.png" layer=0 visible="true" opacity=0
@image storage="../others/Title.png" layer=3  left=1046 top=36 opacity=150 visible="true" 
@animstart layer=3 seg=1 target="*start1"
@position layer=message0 left=-444 top=129 page=fore visible="true" frame="../others/menu_frame.png" marginl="32" margint="28" marginr="32"
@image storage="../others/msg_return.png" layer=4 left=100 top=667 opacity=0 visible="true" 
@move layer=0 time=500 path=(,,255)
@move layer=message0 time=100 delay=100 path=(72,129,255)
@move layer=3 time=200 path=(74,36,255) accel=2
@move layer=4 time=200 delay=300 path=(100,640,255)
@wm

; 剧本选择菜单说明文字层设定
@current layer="message1" 
@position layer=message1 left=120 top=420 width=429 visible="true"
@deffont size="18" 
@defstyle fade=false
@resetfont

*scenario_list| 显示选项
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
;@animstop layer=3 seg=1

;清空说明框并截图
@current layer="message1" 
@er 
@locksnapshot

;准备返回时的状态并写入back
@stopmove
@freeimage layer=1
@freeimage layer=2
@backlay

;清空fore并读取截图
@position layer="message0" visible="false" 
@eval exp="eraseAllLayers()"
@eval exp="kag.fore.layers[0].assignImages(kag.snapshotLayer)"
@eval exp="kag.fore.layers[0].visible=true"
@eval exp="kag.fore.layers[0].setSizeToImageSize()"
@pimage layer=0 storage="../others/bg_dark.png"

; TODO: 显示确认窗口
@waitclick

@trans method=crossfade time=1
@wt

@unlocksnapshot
;@animstart layer=3 seg=1 target="*resume1"
@current layer="message0" 
@er
@jump target="*scenario_list"


;@jump target="*start" storage="mainmenu.ks" 

