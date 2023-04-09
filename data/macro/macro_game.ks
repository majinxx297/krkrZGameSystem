; 与实际游戏内容有关的macro
; 包含一部分游戏内容

*scenario_selection| 剧本选择界面

@macro name=scn1_onenter
@image storage="../others/scn1_text.png" mode="psmul" opacity=50 layer=2 left=945 top=47 page=fore visible="true" 
@image storage="../others/scn1_fg.png" mode="psadd" layer=1 opacity=100 left=369 top=150 page=fore visible="true" 
@move layer=1 time=500 path=(,$-50,$+25)(,$-50,$+25)(,$-50,$+25)(,$-50,)(,$-50,)(,$-50,$-25)(,$-50,$-25)(,$-50,$-25)(,$-50,0)(,$+450,0) repeat=100
@move layer=2 time=800 path=(,$+10,$+60) accel=-2
@current layer="message1" 
@er
@delay speed=15
「————为救回爱子之人提供金币十万枚作为谢礼。」[r]
急需用钱的你为了巨额赏金，与搭挡一同潜入沉睡在矿镇附近的迷宫「星月宫」寻找走失的少年。[r]
在迷宫深处等待着你的是未知的冒险以及戴着鸟面的神秘男子。
@endmacro

@macro name=scn2_onenter
@current layer="message1" 
@er
@delay speed=15
你的好友
星月宫的另一幅面孔
将对好友的感情深藏于心中[r]
@endmacro

; 所有scn通用onleave
@macro name=scn_onleave
@current layer="message1" 
@er
@freeimage layer=1
@freeimage layer=2
@stopmove
@endmacro

@return