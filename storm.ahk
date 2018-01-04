#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  

$q::    
  Send, q 
  Sleep, 50  
  Send, g   
return 

$r::    
  Send, r   
  Sleep, 500
  Send, g   
return 