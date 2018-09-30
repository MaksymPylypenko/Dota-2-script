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

; Refresher
; LWin:: 
  ; item(6) ; hex
  ; ability(4) ; blast
  ; create("eew")
  ; ability(4) ; meteor
  ; item(2) ; refresher 
  ; ability(4) ; meteor4 
  ; Sleep, 900
  ; ability(5) ; blast
  ; item(6) ; hex
  ; create("eee")
  ; ability(4) ; sun  
; return

 

send(sequence)
{
	Loop, Parse, sequence
	Send % A_LoopField
	delay()
}

create(sequence)
{
	send(sequence)
	ability(6)
	Sleep, 200
}


