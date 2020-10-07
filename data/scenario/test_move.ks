*start|

[layopt layer=message0 opacity = 0]
[image storage=sakka.png layer=0 page=fore visible=true left=0 top=140 opacity=0]
[iscript]
function stretch(layers_no, dest_width, dest_height)
{
	var layer_dest = kag.fore.layers[layers_no];
	var dest_w = dest_width;
	var dest_h = dest_height;

	var tempLayer = new Layer(kag, layer_dest);
	tempLayer.assignImages(layer_dest);

	layer_dest.setImageSize(dest_w, dest_h);
	layer_dest.setSizeToImageSize();

	layer_dest.stretchCopy(0,0,dest_w,dest_h, tempLayer,0,0,tempLayer.imageWidth,tempLayer.imageHeight, stLinear);

	invalidate tempLayer;
}
;stretch(0, 233, 707);
[endscript]
[move time=200 path="(300,140,255)" accel=-1 layer=0]
[wm]
[move time=2000 path="(400,140,255)" layer=0]
[wm]
[move time=200 path="(700,140,0)" accel=1 layer=0]
[wm]
[layopt layer=message0 opacity = 255]
[jump storage=first.ks target=*menu]