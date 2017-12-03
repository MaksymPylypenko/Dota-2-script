#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  
#CommentFlag //

delay()
{	
  Random, delay, 50,  150
  Sleep, delay
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
  Send, q
  delay()
  Send, q
  delay()
  Send, q
return

LAlt & w::  
  Send, w
  delay()
  Send, w
  delay()
  Send, w
return

LAlt & e::  
  Send, e
  delay()
  Send, e
  delay()
  Send, e
return
 




