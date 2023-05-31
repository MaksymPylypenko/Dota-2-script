#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/earthspirit.png", 1)

; invisible stone
LAlt & w::{
  Send "w"
  Send "!d"
  Sleep 500 ; 600
  Send "q"
  Reload
}
  
; stun
LAlt & q::{
  Sleep 50 ; blink delay to avoid selfcast bug 
  Send "!d"
  Sleep 50
  Send "q"   
  Reload
}
