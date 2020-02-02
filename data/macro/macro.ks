; Common utils
*macro|

; Relative move
; TODO: set default values (opacity etc
; TODO: add support to message layer
[macro name=rmove]
[eval exp="mp.left = kag.fore.layers[mp.layer].left + (+mp.dx)"]
[eval exp="mp.top = kag.fore.layers[mp.layer].top + (+mp.dy)"]
[move * path="&mp.left+','+&mp.top+','+&mp.opacity" time=%time|250]
[endmacro]

; Free all fg layers
[iscript]
function freeFgLayers()
{
	for (var i = 0; i < kag.fore.layers.count; i++ ){
		kag.fore.layers[i].freeImage();
	}
	for (var i = 0; i < kag.back.layers.count; i++ ){
		kag.back.layers[i].freeImage();
	}	
}
[endscript]
[macro name=freeimages]
[eval exp="freeFgLayers()"]
[endmacro]

; TODO: free all

[macro name=args]
; pass non-Unicode arg names to this empty macro so that FlashDevelop will list those arg names into autocomplete list
[endmacro]

[return]