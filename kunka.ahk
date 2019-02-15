I_Icon = icons/kunka.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

; 4000 ms - max duration of x-mark.  
; 400 ms - torrent, x-mark cast animation. 
; 1600 + 400 = 2000 ms - effective impact delay for torrent. 
; 2000 - 400 = 1600 ms - wait after torrent to return with x-mark.
; 4000 - 1600 = 2400 ms - the longest possible time to use gapless torrent after using x-mark (no return). 

; torrent during x
LAlt & d::  
  Send, q
  sleep, 1600
  Send, e
  Send, {%attack%}    
  Reload
return

; ship --> torent
LAlt & f::  
  Send, r
  Sleep, 2690
  Send, e
  Sleep, 100
  Send, q
  Reload
return

; armlet
LAlt & x::  
  item(2)
  Sleep, 60
  item(2)
return
