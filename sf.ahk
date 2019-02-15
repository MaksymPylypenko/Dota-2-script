I_Icon = icons/sf.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

; Directional Raze
; --------------------------------------------
; uses directional move to direct the hero, follows with a raze and an attack hotkey

;1
LAlt & q::
  direct()
  Send, q  
  delay()
  Send, {%attack%}  
return 

;2
LAlt & w::  
  direct()
  Send, w
  delay()
  Send, {%attack%}  
return

;3
LAlt & e::  
  direct()
  Send, e
  delay()
  Send, {%attack%}  
return

; Eul combo 
; --------------------------------------------
; very situational, since you might need to use blink first  

LAlt & d::
  direct()
  item(2)    			; change to YOUR EUL HOTKEY
  Sleep, 830 			
  Send, {%stop%}    	
  item(3)				; change to YOUR BLINK HOTKEY
  delay() 				
  ability(6)			
return

