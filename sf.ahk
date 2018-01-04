#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  

direct()
{
  Send, {v Down}
  Send, {Click, R}  
  Send, {v Up}  
}

$q::    
  Send, {v Down}
  Send, {Click, R}  
  Send, {v Up}  
  Send, q  
return


$w::  
  direct()
  Send, w
return


$e::  
  direct()
  Send, e
return

