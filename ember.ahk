I_Icon = icons/ember.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

; Fist --> Chain combo
; Make sure the hero is watching towards the enemy and there is no rotational animation.
; A directional move may help direct the hero. 
LAlt & q::    
  Send, w
  Sleep, 100
  Send, q
return