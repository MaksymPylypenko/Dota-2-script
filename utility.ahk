#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  
SetNumlockState, AlwaysOn
SetCapsLockState, Off


; Config 
;=======================================================================

global item1 = "z"
global item2 = "x"
global item5 = "c"
global item4 = "t"
global item3 = "WheelUP"
global item6 = "WheelDown"


; Use Window Spy to find your coordinates
; This is valid for 1600 x 900 only 

global x1 = 950	   	; 1st column
global x2 = 1000	; 2nd column
global x3 = 1055	; 3d column
global y1 = 800	   	; 1st row - items
global y2 = 845	   	; 2nd row - items
global y3 = 880     ; 3d row - backpack	  



; Hotkeys
;=======================================================================


; If you remap Capslock, you can use it as an extra hotkey
CapsLock:: /


; Pause / Unpause Script
LWin::  
	suspend
	SoundPlay, sounds/scan.mp3
return


; Right click spammer (50ms delay)
LAlt & ~RButton::  
	repeater("RButton","RButton")
return


; Resend courier to the next available teamate
; This is valid for 1600 x 900 only 
LAlt & `::
{
	mousegetpos,x,y
	Click, right, 1514, 875 ; coordinates of the courier icon 
	MouseMove, 1514, 816  ; coordinates of the 1st alliy 
	Sleep, 250
	PixelGetColor, check, 1514, 816, RGB	
	if check != 0xEAE9E91
	{
		Click, 1514, 816
	}	
	mousemove,%x%,%y%
}
return


; Uses 1st item from backpack 
LAlt & z::
{   	
	backpack(1)
}
return

; Uses 2nd item from backpack 
LAlt & x::
{   	
	backpack(2)
}
return



; Functions
;=======================================================================

; Repeater 
repeater(key, host)
{	
    While GetKeyState(host,"p")
    {
        Send, {%key%}
        Sleep, 50
    }
    return
}


; Human delay
delay()
{	
  Random, delay, 50,  150
  Sleep, delay
}


; Directional move + right click
direct()
{  
  Send, {v Down}
  Send, {Click, R}  
  Send, {v Up}       
}
forcestuff(key)
{		
	Send, {Alt Down}	
	Send, {%key%}	
	Send, {Alt Up}
}  


; Drag item
drag(x1,y1,x2,y2)
{ 		
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} 
}
dragr(x2,y2,x1,y1)
{ 		
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} 
}


; Press item
item(i)
{		 
	if i = 1
		Send, {%item1%}
	else if i = 2
	{	
		Send, {%item2%} 
	}
    else if i = 3
	{	
		Send, {%item3%} 
	}
    else if i = 4
	{	
		Send, {%item4%} 
	}
    else if i = 5
	{	
		Send, {%item5%} 
	}
    else if i = 6
	{	
		Send, {%item6%} 
	}	
}


; use item from backpack
backpack(i)
{
	;mousegetpos,x,y
	if i = 1
	{
		currX = %x1%
		currI = 4
	}
	else if i = 2
	{
		currX = %x2%
		currI = 5
	}
	else if i = 3
	{
		currX = %x3%
		currI = 6
	}
	drag(currX,y3,currX,y2)
	Sleep, 50
	item(currI)
	Sleep, 50
	dragr(currX,y3,currX,y2)
	;mousemove,%x%,%y%
}