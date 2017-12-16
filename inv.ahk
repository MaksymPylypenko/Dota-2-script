#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  
#CommentFlag //

delay()
{	
  Random, delay, 50,  150
  Sleep, delay
}

long_delay()
{	  
  Sleep, 150
}

use(key)
{
  Send, {%key%}
  delay()
  Send, {%key%}
  delay()
  Send, {%key%}
  Return
}


LAlt & q::    
  send("cold")
return


LAlt & w::  
  send("emp")
return


LAlt & e::  
  send("sun")
return


~q & LAlt::  
  send("ice") 
  send, r
  long_delay()
  send, d  
return


~w & LAlt::  
  send("ghost_q") 
  send, r
  send, q 
  long_delay()
  send, d
return

+w::  
  send("ghost_w") 
  send, r
  send, w 
  delay()
  send, w 
  long_delay()
  send, d
return

~e & LAlt::  
  send("alacrity") 
  send, r
  long_delay()
  send {LAlt down}{d}{LAlt up}
  send, e
  delay()
  send, e  
  send, g
return

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


