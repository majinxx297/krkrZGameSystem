; moving button
*start|
@eval exp="Scripts.execStorage('title.tjs');"

@image storage=BG00 layer=base
@rclick call=true target="*rclick" name="backward" enabled=true

@current layer=message0
@locate x=600 y=360
@eval exp="tf.btn = []"
@eval exp="tf.btn[0] = kag.current.numLinks"
@button graphic=btn hint="one button" 

@locate x=600 y=400
@eval exp="tf.btn[1] = kag.current.numLinks"
@button graphic=btn hint="another button" exp="showSubMenu(1, 400)"

@locate x=600 y=440
@eval exp="tf.btn[2] = kag.current.numLinks"
@button graphic=btn hint="yet another button"
@backlay
@s

*rclick
@if exp="tf.inSub==1"
@trans layer=message0 time=300 method=crossfade
@eval exp="tf.inSub=0"
@endif
@return
