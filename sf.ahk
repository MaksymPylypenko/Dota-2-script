I_Icon = icons/sf.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

;1
LAlt & q::  
  direct()
  Send, q  
  Reload  
return 

;2
LAlt & w::  
  direct()
  Send, w
  Reload  
return

;3
LAlt & e::  
  direct()
  Send, e
  Reload  
return

LAlt & r::
  Send, 0      
  ; Sleep, 0 
  Sleep, 830 // 830 is an exact delay 
  Send, { Space }  
  Send, t
  Sleep, 200
  Send, r  
return
