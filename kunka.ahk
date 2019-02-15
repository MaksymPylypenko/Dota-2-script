I_Icon = icons/kunka.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force


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
