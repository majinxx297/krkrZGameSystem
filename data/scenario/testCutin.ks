; FFD-like CG
*start|
[cm]
[image layer=base storage=sampleCG  visible=true left=0]
主体CG[l][r]
;[image layer=1 storage=sampleCG_p1_b visible=true left=225 top =180 opacity=0]
[fgzoom storage=sampleCG_p1_b layer=1 sw=1 sh=720 st=0 sl=325 dw=213 dh=720 dt=0 dl=225 time=500 accel=2]
[image layer=2 storage=sampleCG_p1_f visible=true left=-10 top=240 opacity=0]
[iscript]
tf.parent = kag.fore.layers[2].parent;
kag.fore.layers[2].parent = kag.fore.layers[1];
[endscript]
[wfgzoom]
;[rmove layer=1 dy=-180 opacity=255 time=200]
[rmove layer=2 dx=20 opacity=255 time=1000]
[wm]
Cut-in,移动角色[l][r]

[iscript]
Debug.message(tf.parent);
kag.fore.layers[2].parent = tf.parent;
[endscript]

[freeimage layer=base]
[freeimages]
[jump storage=first.ks target=*menu]