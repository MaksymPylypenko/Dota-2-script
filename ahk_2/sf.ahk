#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/sf.png", 1)

; Directional Raze
; --------------------------------------------
; uses directional move to direct the hero, follows with a raze and an attack hotkey


LAlt & q::{
  Send "{LAlt up}{" config.directional_move " down}{Click R}{" config.directional_move " up}"
  Send "q"  
  Sleep 50
  Send config.attack
}

LAlt & w::{
  Send "{LAlt up}{" config.directional_move " down}{Click R}{" config.directional_move " up}"
  Send "w"
  Sleep 50
  Send config.attack
}

LAlt & e::{  
  Send "{LAlt up}{" config.directional_move " down}{Click R}{" config.directional_move " up}"
  Send "e"
  Sleep 50
  Send config.attack
}

