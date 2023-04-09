; 对话界面（虚构勇者）
*start|
@history output=true enabled=true
@rclick enabled=true

@bg storage=BG00
@dialog_in

@fg_in name=银杏 normal r talk
「爷来了。」[n]

@银杏 sad talk
「爷哭了。」[n]

@dialog_in
@fg_in name=拉斯塔 normal l talk
「爷也来了，[l]

@银杏 normal
@拉斯塔 smile2 popy
但是爷不哭！」[n]

@拉斯塔 talk
「rerorerorerorerorerorerorerorerorerorerorerorerorerorerorerorerorerorero」[n]

@银杏 talk
「prprprprprprprprprprprprprprprprprprprprprprprpr」[n]

@fg_out all

两个人离开了房间。[n]

@dialog_out

@jump storage="mainmenu.ks" target=*start

