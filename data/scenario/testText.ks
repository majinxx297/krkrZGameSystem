; Typemoon(?) style message window
; 太蛋疼了，大概不会用
*start|
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
然后我又又又又写了一行字[l][r]
[cm]

*take2|
@position layer=message0 visible=true top=300 width=250 height=80
@position layer=message4 visible=true top=0
@eval exp="kag.fore.messages[4].parent=kag.fore.messages[0]"
@current layer=message4
我写我写我写写写[r]
我写我写我写写写[l][r]
@move layer=message4 time=70 path=(,@-60,)
我写我写我写写写[r]
我写我写我写写写[l][r]
@move layer=message4 time=70 path=(,@-60,)
我写我写我写写写[r]
我写我写我写写写[l][r]