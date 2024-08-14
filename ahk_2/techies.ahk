#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/techies.png", 1)

; Spam mines
; --------------------------------------------
; This can also be achieved by using mouse wheel up / down as your ultimate hotkey on quickcast
; However, I am already using mouse wheel for items.
; Unfortunately, using an AHK to spam a hotkey causes this issue:
; https://www.reddit.com/r/DotA2/comments/1cwut6d/this_almost_looks_like_a_softlock_to_prevent/


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