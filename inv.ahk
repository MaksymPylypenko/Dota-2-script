#Include %A_ScriptDir%/utility.ahk
#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  



long_delay()
{	  
  Sleep, 150
}


LAlt & q::    
  send("cold")
return

; LAlt & a::    
  ; send("ice")
; return

LAlt & w::  
  send("emp")
return

; LAlt & s::  
  ; send("alacrity")
; return


LAlt & e::  
  send("sun")
return

; LAlt & d::  
  ; send("meteor")
; return

; eul --> meteor --> sun
; LAlt & t::  
  ; send, 0
  ; sleep, 650
  ; ability(5)
  ; sleep, 400
  ; ability(4)
; return


XButton1:: 
  send("alacrity")
  ability(6)
  sleep, 100
  send, !d
  send("sun")
  send, ee
  send, g
return

XButton2:: 
  send, {Shift Down}
  send("ghost_w")
  ability(6)
  sleep, 100
  send, v
  send, {Shift Up}
return


 

send(ability)
{
  if ability = cold
  {
    Send, q
    delay()
    Send, q
    delay()
    Send, q
  }

  else if ability = emp
  {
    Send, w
    delay()
    Send, w
    delay()
    Send, w
  }

  else if ability = sun
  {
    Send, e
    delay()
    Send, e
    delay()
    Send, e
  }

  else if ability = alacrity
  {
    Send, w
    delay()
    Send, w
    delay()
    Send, e
  }

  else if ability = ghost_q
  {
    Send, w
    delay()
    Send, q
    delay()
    Send, q
  }

  else if ability = ghost_w
  {
    Send, q
    delay()
    Send, q
    delay()
    Send, w
  }

    else if ability = meteor
  {
    Send, w
    delay()
    Send, e
    delay()
    Send, e
  }

  else if ability = ice
  {
    Send, q
    delay()
    Send, q
    delay()
    Send, e
  }
  
}


