#Include %A_ScriptDir%/utility.ahk
#CommentFlag //

//$q
LAlt & q::
  Send, q  
return 

$q::    
  direct()
  Send, q
return

LAlt & w::  
  Send, w
return

$w::  
  direct()
  Send, w
return

LAlt & e::  
  Send, e
return

$e::  
  direct()
  Send, e
return

LAlt & r::
  Send, 0      
  // Sleep, 0 
  Sleep, 830 // 830 is an exact delay 
  Send, { Space }  
  Send, t
  Sleep, 200
  Send, r  
return
