#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/kez.png", 1)

; Aghanim's toggles


; LAlt & r:: {
;   Send "d"  
;   Sleep 75
;   Send "r"  
; }


LAlt & w:: {
  Send "w"  
  Sleep 20
  Send "q"  
}

LAlt & r:: {
  Send "d"  
  Sleep 50
  Send "r"  
  Sleep 50
  Send "q"  
}

; LAlt & q:: {
;   Send "d"  
;   direct(config.directional_move)
;   Sleep 75
;   Send "q"  
; }

; LAlt & w:: {
;   Send "d"  
;   Sleep 100
;   Send "w"  
; }

; LAlt & e:: {
;   Send "d"  
;   Sleep 75
;   Send "e"  
; }

; LAlt & r:: {
;   Send "d"  
;   Sleep 75
;   Send "r"  
; }

; ; Q combo

; LAlt & d:: {
;   Send "d"  
;   direct(config.directional_move)
;   Sleep 75
;   Send "q"  
;   Sleep 75
;   Send "d"  
;   direct(config.directional_move)
;   Sleep 75
;   Send "q"  
;   Sleep 75
;   Send "d"  
; }

; Regular directed Q

; LAlt & q:: {
;   Send "{ h down}"
;   Sleep 50
;   Send "{Click R}"
;   Sleep 50
;   Send "{ h up}"
;   ; Sleep 50
;   ; Send "q"
; }

; LAlt & r:: {
;   Send "d"  
;     Sleep 50
;   Send "q"  
;     Sleep 50
;   Send "d" 
;     Sleep 50 
;   direct(config.directional_move)
;   Send "q"  
;     Sleep 50
;   Send "w"  
;     Sleep 50
;   Send "d"  
;     Sleep 50
;   Send "w"  
;     Sleep 50
;   Send "d"  
;     Sleep 50
;   Send "r"
;     Sleep 50
;   Send "d"  
;     Sleep 50
;   Send "r"  
; }