I_Icon = ../icons/meepo.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

LAlt & w:: 
  Loop, 4 
  {
	  send, `t
	  Sleep, 10
	  send w
	 
  }
  Reload
return

NumpadDot::
{
}
return




