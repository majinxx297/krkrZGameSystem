*start|
@cm
[link target="*example"]煌明MessageLayerADV[endlink][r]
[link target="*example1"]Typemoon style[endlink][r]
[link target="*example2"]向上移动[endlink][r]
@s

*example
@cm
;@style rotmovemode="valuerandom" rotmoveround=30
;@style slantymode="sin" slanty=6 slantyround=15 gradmode="gradloop" gradation="0x0000ff,0xff0000,0xffffff" gradround=30
@style sxmovemode="random" sxmove=-20 symovemode="value" symove=-5
不管了，先写再说[p][cm]
@jump target=*start

*example1
; Typemoon(?) style message window
; 太蛋疼了，大概不会用
@laycount messages=5
@position layer=message2 visible=true top=300
@position layer=message3 visible=true top=300
@position layer=message4 visible=true top=300

@current layer=message2
我先写了一行字[l][r]
@move layer=message2 time=70 path=(,@-20,120)
@current layer=message3
然后我又写了一行字[l][r]
@move layer=message2 time=70 path=(,@-20,120)
@move layer=message3 time=70 path=(,@-20,120)
@current layer=message4
然后我又又又又写了一行字[l][r][cm]
@laycount messages=2
@jump target=*start

*example2
@laycount messages=5
@position layer=message1 visible=true top=300 width=250 height=80
@position layer=message4 visible=true top=0
@eval exp="kag.fore.messages[4].parent=kag.fore.messages[1]"
@current layer=message4
我写我写我写写写[r]
我写我写我写写写[l][r]
@move layer=message4 time=70 path=(,@-60,)
我写我写我写写写[r]
我写我写我写写写[l][r]
@move layer=message4 time=70 path=(,@-60,)
我写我写我写写写[r]
我写我写我写写写[l][r]
@laycount messages=2
@jump target=*start