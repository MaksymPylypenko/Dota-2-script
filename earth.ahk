#Include %A_ScriptDir%/utility.ahk

; invisible stone
LAlt & w::  
  Send, w
  Send, !d
  Sleep, 575 ; 600
  Send, q
  Reload
return
  
; stun
LAlt & q::
  Sleep, 50 ; blink delay to avoid selfcast bug 
  Send, !d
  Sleep, 50
  Send, q   
  Reload
return


; the true self cast
; doesn't solve the problem...
iconCast()
{
	mousegetpos,x,y	
	mousemove, 560,820	
	sleep,50
	Send, d
    sleep, 5
	mousemove, x,y
}
