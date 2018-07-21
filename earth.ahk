#Include %A_ScriptDir%/utility.ahk
#CommentFlag //


// aghs
// LAlt & f::  
  // Send, d
  // Sleep, 50
  // Send, e  
  // Send, f
  // Send, w  
  // Sleep, 600 
  // Send, q
// return

// silence
LAlt & e::  
  Send, d
  Sleep, 50
  Send, e  
  Reload
return

// invisible stone
LAlt & w::  
  Send, w
  Send, !d
  Sleep, 575 // 600
  Send, q
  Reload
return
  
 // stun
LAlt & q::
  Sleep, 10 // blink delay
  Send, !d
  Sleep, 50
  Send, q   
  Reload
return


// self stone... still  doesn't work 
d()
{
	mousegetpos,x,y	
	mousemove, 560,820	
	sleep,50
	Send, d
    sleep, 5
	mousemove, x,y
}
