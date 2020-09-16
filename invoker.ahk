I_Icon = icons/invoker.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

LAlt & q::    
  send("qqq")
return

LAlt & w::  
  send("www")
return

LAlt & e::  
  send("eee")
return


; Helps avoid missclicks
LAlt & r::  
  send, r
return
 

send(sequence)
{
	Loop, Parse, sequence
	{
		Send % A_LoopField		
	}	
}

