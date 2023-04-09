; camera zoom
; TODO: 
; - compatibility with fg system
; - merge into testMotions.ks

*start|
@bg storage=BG00
@fg_in name=银杏 normal r
@fg_in name=拉斯塔 normal l

@move layer=0 page=fore time=500 path="(,,,200,)"
@move layer=1 page=fore time=500 path="($-400,,150,200,)"
@move layer=2 page=fore time=500 path="($+400,,150,200,)"
@wm

@waitclick

@dialog_in

@拉斯塔 talk
我变大了[p][cm]

@银杏 talk
我也变大了[p]

@return
	