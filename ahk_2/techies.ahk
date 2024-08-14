#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/techies.png", 1)

; Directional Raze
; --------------------------------------------
; uses directional move to direct the hero, follows with a raze and an attack hotkey



; WheelUp::SendInput "{r}"
Random sleepTime := Random(20, 60)


!r:: 
{  
  while GetKeyState("r","P"){
    Send "r"
    Sleep sleepTime
  }
  return
}



; AutoClickEnabled := true

; Auto-click "r" when "r" is pressed and held
; ~r:: {
;   ; Check if auto-click is enabled
;   ; if (AutoClickEnabled) {
;       ; Keep clicking "r" until "r" is released
;       while (GetKeyState("r", "P")) {
;           Send "r"
;           Sleep 10 ; Adjust the sleep time to change the speed of auto-clicking
;       }
;   ; }
; }

; ; Disable auto-clicking when "Enter" is pressed
; Enter:: {
;     AutoClickEnabled := false
; }

; ; Re-enable auto-clicking when "Esc" is pressed
; Esc:: {
;     AutoClickEnabled := true
; }