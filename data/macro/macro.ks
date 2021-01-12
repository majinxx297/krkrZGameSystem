; Common utils
*macro|
; --------------------------------------------------------
; General utils
; --------------------------------------------------------
@macro name=clip
@eval exp="kag.fore.layers[mp.child].parent = kag.fore.layers[mp.parent]"
@endmacro

@macro name=unclip
@eval exp="kag.fore.layers[mp.child].parent = kag.fore.base"
@endmacro

; --------------------------------------------------------
; label related
; --------------------------------------------------------
@macro name=savepoint
@p
@cm
@label
@cm
@endmacro

@macro name=page
@eval exp="tf.autosave = 0" cond="tf.autosave === void"
@eval exp="tf.autosave = (tf.autosave+1)%kag.numBookMarks"
@call storage=macro.ks target=*savepoint
;@save place=&tf.autosave
@endmacro

@macro name = n
@p
@cm
@endmacro

@macro name = sp
@stopse
@p
@endmacro

@macro name = sl
@stopse
@l
@endmacro

@return


; --------------------------------------------------------
; FOR FLASHDEVELOP AUTOCOMP SUPPORT ONLY
; --------------------------------------------------------

; pass non-Unicode arg names to this empty macro so that FlashDevelop will list those arg names into autocomplete list
@macro name=args
@endmacro

*savepoint|
@return