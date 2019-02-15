I_Icon = icons/magnus.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

LAlt & r::  
	directedAbility(6)	
return

; d::
	; repeatAnimation(1,"q")
; return

; f::
	; repeatAnimation(6,"r")
; return


repeatAnimation(skill, host)
{  
  Loop
  { 
	ability(skill)
	;Random, rand, 50, 150
	;rand = 350 ; monkey king 
    rand = 70 ; magnus 
	Sleep, %rand%
	Send, {space}
    If (!GetKeyState(host,"p"))
	{
	  ;Send, q
      break
	}
  } 
}  

