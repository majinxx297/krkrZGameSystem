*start|
@loadplugin module=extrans.dll
@loadplugin module=extNagano.dll

@call storage="WindowResizable.ks"
@call storage="AltEnterFullScreen.ks"
@call storage=SaveAnyWhere.ks
@call storage=macro.ks
@call storage=macroBasic.ks
@eval exp="Scripts.execStorage('MessageLayerADV.tjs');"
@position layer=message0 visible=true