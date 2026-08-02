#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/invoker.png", 1)

LAlt & q::Send "qqq"
LAlt & w::Send "www"
LAlt & e::Send "eee"

; Helps avoid missclicks
LAlt & r::send "r"

; Invoker combo: Directional move -> Sun Strike -> Chaos Meteor -> Item -> Invoke -> EMP -> Sun Strike -> Chaos Meteor
; LAlt & 5::{
; 	direct(config.directional_move)
; 	Sleep 40
; 	Send "eee"
; 	Sleep 40
; 	Send "r"
; 	Sleep 40
; 	Send "eew"
; 	Sleep 40
; 	Send "r"
; 	Sleep 40
; 	Send "!f"
; 	Sleep 40
; 	Send "d"
; 	Sleep 100
;   direct(config.directional_move)
;   Sleep 40
; 	Send "www"
; 	Sleep 40
; 	Send "r"
;   Sleep 40
; 	Send "d"
; }


