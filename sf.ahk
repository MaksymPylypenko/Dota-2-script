I_Icon = icons/sf.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

;1
LAlt & q::
  direct()
  long_delay()
  Send, q  
  delay()
  Send, {%attack%}  
return 

;2
LAlt & w::  
  direct()
  long_delay()
  Send, w
  delay()
  Send, {%attack%}  
return

;3
LAlt & e::  
  direct()
  long_delay()
  Send, e
  delay()
  Send, {%attack%}  
return

LAlt & r::
  Send, 0     
  Sleep, 830 ; 830 is an exact delay 
  Send, { Space }  
  Send, t
  Sleep, 200
  Send, r  
return
