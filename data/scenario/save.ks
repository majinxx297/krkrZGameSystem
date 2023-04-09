*save
@dialog hide
@eval exp="blurLayers(0,kag.numCharacterLayers-1)"
@eval exp="tf.num = kag.numCharacterLayers"
@laycount layers=&tf.num+3

@image layer=&tf.num storage=black visible=true opacity=100

@image layer=&tf.num+1 storage=ticket visible=true left=0 top=400 scale=50 angle=-60 opacity=0
@image layer=&tf.num+2 storage=book_base left=205 top=64 visible=true opacity=0
@move layer=&tf.num+1 path=(,,255,50,-15) time=600
@move layer=&tf.num+2 path=(,$+50,255)(,$-20,)(,$+10,) time=300
@wm

;@waitclick
@rclick jump=true storage="save.ks" target=*endsave 
@s

*endsave
@laycount layers=&tf.num
@eval exp="resetLayers(0,kag.numCharacterLayers-1)"
@dialog show
@return