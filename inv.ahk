#Include %A_ScriptDir%/utility.ahk
#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  


; Select 3 elements
LAlt & q::    
  send("qqq")
return

LAlt & w::  
  send("www")
return

LAlt & e::  
  send("eee")
return



; Eul --> meteor --> sun
; LWin:: 
  ; send, 0
  ; sleep, 900 ; sun
  ; ability(5)
  ; sleep, 400 ; meteor
  ; ability(4)
; return

; f5:: 
  ; ; item(6) ; hex
  ; ability(5) ; blast  
  ; Sleep, 100
  ; ability(4) ; meteor
  ; Sleep, 100
  ; create("eee")
  ; Sleep, 100
  ; ; send, {LAlt down}
  ; ability(4) ; cataclysm
  ; ; send, {LAlt up}
  ; Sleep, 100
  ; item(3) ; refresher 
  ; Sleep, 100
  ; ; send, {LAlt down}
  ; ability(4) ; cataclysm
  ; ; send, {LAlt up}
  ; Sleep, 100
  ; ability(5) ; meteor4 
  ; Sleep, 700
  ; create("qwe")
  ; ability(4) ; blast
  ; Sleep, 100
  ; ;item(6) ; hex  
; return

 

send(sequence)
{
	Loop, Parse, sequence
	{
		Send % A_LoopField		
		;delay()
	}
	
}

create(sequence)
{
	send(sequence)
	ability(6)
	Sleep, 200
}


