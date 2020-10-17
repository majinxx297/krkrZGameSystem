; photoshop演出workflow测试
*start|
@image layer=1 page=fore storage=AN00N left=111 top=73 visible=true
@image layer=0 storage=BG00 visible=true
@position layer=message0 visible=true
哈鸡妈撸唷[l][cm]
; k1
@move layer=1 time=1000 path=(-170,89,,140,) 
@move layer=0 time=1000 path=(-370,-234,,162,)
@wm
@waitclick
; k2
@move layer=1 time=300 path=(-331,620,144,) 
@move layer=0 time=300 path=(-683,0,162,)
@wm
@waitclick
;k3
@move layer=1 time=300 path=(-604,-485,,146,) 
@move layer=0 time=300 path=(-775,-450,,168,) 
@wm