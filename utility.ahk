#NoEnv
#CommentFlag //
SendMode Input 
SetWorkingDir %A_ScriptDir%  
SetNumlockState, AlwaysOn
SetCapsLockState, Off


// Remap
CapsLock:: /


// Repeater 
repeater(key, host)
{	
    While GetKeyState(host,"p")
    {
        Send, {%key%}
        Sleep, 30
    }
    return
}

LAlt & ~RButton::  
repeater("RButton","RButton") // replace "Rbutton" with any key
return

// Human delay
delay()
{	
  Random, delay, 50,  150
  Sleep, delay
}

// Canceles backswing animation, your target has to be insie your spell radius 
backswing(ability,delay)
{    
    Send, {%ability%}
    Sleep, %delay%
    Send, g // replace this with your attack key
}

// Pause / Unpause 
LWin::  
	suspend
	SoundPlay, sounds/scan.mp3
return


//Directional move + right click
direct()
{  
  Send, {v Down}
  Send, {Click, R}  
  Send, {v Up}       
}

forcestuff(key)
{			
	direct()		
	Sleep, 200  
	Send, {Alt Down}	
	Send, {%key%}	
	Send, {Alt Up}
}  

// Resend courier 
LAlt & `::
{
	mousegetpos,x,y
	Click, right, 1514, 875 // coordinates of the courier icon 
	MouseMove, 1514, 816  // coordinates of the 1st alliy 
	Sleep, 250
	PixelGetColor, check, 1514, 816, RGB	
	if check != 0xEAE9E91
	{
		Click, 1514, 816
	}	
	mousemove,%x%,%y%
}
return