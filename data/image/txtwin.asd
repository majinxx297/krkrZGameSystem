@loadcell
;
*open
@macro name=txtwin
@copy dx=0 dy=0 sx=%x sy=0 sw=545 sh=176
@wait time = 30
@endmacro
;

*start

@txtwin x=2725
@txtwin x=2180
@txtwin x=1635
@txtwin x=1090
@txtwin x=545
@txtwin x=0
;@iscript
;kag.fore.layer[1].stretchCopy(0, 0, 50, 15, kag.fore.layer[1], 0, 0, 545, 176, stNearest, -1.0);
;@endscript


;@jump target=*start