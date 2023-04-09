*start|
@loadplugin module=extrans.dll
@loadplugin module=extNagano.dll
@loadplugin module=wuvorbis.dll

@call storage="../plugin/WindowResizable.ks"
@call storage="AltEnterFullScreen.ks"
@call storage=SaveAnyWhere.ks
@call storage=ExtHistoryLayer.ks
@call storage=macro.ks
@call storage=macro_game.ks
@rclick storage="rclick.ks" target="*rclick" enable=true call=true

@eval exp="Scripts.execStorage('common.tjs');"
@eval exp="Scripts.execStorage('MessageLayerADV.tjs');"
@position layer=message0 visible=true width=450

@image storage=white layer=base
@jump target=*start storage="mainmenu.ks"
