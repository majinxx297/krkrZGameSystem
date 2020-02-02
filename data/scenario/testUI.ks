; test graphic frame, curtain trans rule and adventaged message layer (by system koumei)
;FIXED: cannot find this plugin after script reloading; It's GraphicFramePlugin's fault 
;FIXED:	text lose shadow after scenario reloading
;		Caused by text effect plugin (FadeLayer etc)
;		try the latest version again
;BUG:	With latest text effect plugin, text start from outside of the message window
;		Triggered if I add attr "rot="
;TODO:	integrate cl_win.ks with GraphicFramePlugin 

*start|
; Load background images
[image storage=BG01 layer=base page=fore]

; Set animation message window
[cm]
[image storage="txtwin" page=fore layer=0 visible=true]
[graphicframe_add layer=message0 page=fore graphiclayer=1 graphicautohide=true]
[animstart layer=0 page=fore seg=1 target="*open"]

; Display text with koumei plugin
;@style gradmode="gradrandom" gradation="0x00ff00,0xff0000,0xffffff" gradround=15 rot=30
[style sxmovemode="valuerandom" sxmove=1 symovemode="random" symove=5 gradmode="gradrandom" gradation="0x00ff00,0xff0000,0xffffff" gradround=15]
这里是测试画面,你现在看到了一行漫无边界的测试文字请不要在意请不要在意请不要在意请不要在意请[r_Don't_Worry][ch_不要在意][r][waitfadech][l]

*|
; Curtain up trans
[backlay]
[image storage=BG03 layer=base page=back]
[trans layer=base time=400 method=universal rule=makuage vague=1]
[wt]

; test zoom.ks
[cm]
[waitclick]
你好啊你好啊[l]
[fgzoom storage=katarina layer=0 sl=0 st=0 sw=579 sh=463 dl=0 dt=0 dw=579 dh=200 time=200]
[wfgzoom canskip=true]
[waitclick]

[freeimage layer=base]
[freeimages]
@jump storage=first.ks target=*menu