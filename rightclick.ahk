#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  
#CommentFlag //
SetNumlockState, AlwaysOn
SetCapsLockState, Off
CapsLock:: /


// Improved rightclick spam
LAlt & ~RButton::  
While GetKeyState("RButton","p")
{
	Click, R
	Sleep, 50
}
return


// Quick 
~b:: Click
~v:: Click, R


// Resend cour 
LAlt & `::
{
	mousegetpos,x,y

	Click, right, 1514, 875  
	MouseMove, 1514, 816  
	Sleep, 250

	PixelGetColor, check, 1514, 816, RGB	
	

	if check != 0xEAE9E91
	{
		Click, 1514, 816
	}
	
	mousemove,%x%,%y%
}
return


// Pause / Unpause 
LWin::  
	suspend
	SoundPlay, sounds/scan.mp3
return