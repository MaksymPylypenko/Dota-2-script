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

global ability1 = "q"
global ability2 = "w"
global ability3 = "e"
global ability4 = "d"
global ability5 = "f"
global ability6 = "r"

global directional_move = "v"

; Use Window Spy to find your coordinates
; This is valid for 1600 x 900 only 

global x1 = 950	   	; 1st column
global x2 = 1000	; 2nd column
global x3 = 1055	; 3d column
global y1 = 800	   	; 1st row - items
global y2 = 845	   	; 2nd row - items
global y3 = 880     ; 3d row - backpack	  


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
  Send, {%directional_move% Down}
  Send, {Click, R}  
  Send, {%directional_move% Up}       
}


; Drag item
drag(x1,y1,x2,y2)
{ 		
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} 
}
dragr(x2,y2,x1,y1)
{ 		
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} ; reversed
}


; Press item/ability
item(i)
{			
	if i = 1	
		Send, {%item1%}	
	else if i = 2		
		Send, {%item2%} 	
    else if i = 3		
		Send, {%item3%} 	
    else if i = 4	
		Send, {%item4%} 	
    else if i = 5		
		Send, {%item5%} 	
    else if i = 6	
		Send, {%item6%} 	
}
; Press ability
ability(i)
{		
	if i = 1	
		Send, {%ability1%}	
	else if i = 2	
		Send, {%ability2%} 	
    else if i = 3	
		Send, {%ability3%} 	
    else if i = 4	
		Send, {%ability4%} 	
    else if i = 5	
		Send, {%ability5%} 	
    else if i = 6	
		Send, {%ability6%} 	
}


; Direct hero first, then use ability/item
; to bind use "$<key>::<sequence>" 
; if alt is pressed, direct() doesn't work
directedAbility(i)  
{  
  direct()
  sleep, 50
  ability(i)    
}
directedItem(i)  
{  
  direct()
  sleep, 50
  item(i)    
}


; use item from backpack
backpack(i)
{	
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
}
backpackL(i)
{
	mousegetpos,x,y
	backpack(i)
	mousemove,%x%,%y%
}


; Default hotkeys for all other scripts 
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
	; While GetKeyState("RButton","RButton")
    ; {
        ; Send, {%key%}
        ; Sleep, 50
    ; }
return


; Resend courier to the next available teamate
; This is valid for 1600 x 900 only 
LAlt & `::
{
	mousegetpos,x,y
	Click, right, 1514, 875 ; coordinates of the courier icon 
	MouseMove, 1514, 816  ; coordinates of the 1st ally 
	Sleep, 250
	PixelGetColor, check, 1514, 816, RGB	
	if check != 0xEAE9E91
	{
		Click, 1514, 816
	}	
	mousemove,%x%,%y%
}
return