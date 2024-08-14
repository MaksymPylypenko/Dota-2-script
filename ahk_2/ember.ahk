#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/ember.png", 1)

; Fist --> Chain combo
; Make sure the hero is watching towards the enemy and there is no rotational animation.
; A directional move may help direct the hero. 
LAlt & q:: {
    Send "w"
    Sleep 100
    Send "q"
}