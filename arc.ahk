I_Icon = icons/arc.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force


; Select 3 elements
LAlt & z::
  mousegetpos,x,y	; save mouse position
  Send {LShift Down}
  click, 514 803
  Sleep, 100
  Send {LShift Up}
  
  Sleep, 100
  
  Send { LCtrl Down}
  send a
  Sleep, 100
  Send { LCtrl Up}
  mousemove x,y
return

LAlt & x::
  mousegetpos,x,y	; save mouse position
  Send {LShift Down}
  click, 533 803
  Sleep, 100
  Send {LShift Up}
  
  Sleep, 100
  
  Send { LCtrl Down}
  send s
  Sleep, 100
  Send { LCtrl Up}
  mousemove x,y
return


