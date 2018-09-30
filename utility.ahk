#NoEnv
#SingleInstance force
SendMode Input 
SetWorkingDir %A_ScriptDir%  
SetNumlockState, AlwaysOn
SetCapsLockState, Off
#Include %A_ScriptDir%/pn.ahk


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

; 1600 x 900
global x1 = 950	   	; 1st column
global x2 = 1000	; 2nd column
global x3 = 1055	; 3d column
global y1 = 800	   	; 1st row - items
global y2 = 845	   	; 2nd row - items
global y3 = 880     ; 3d row - backpack	  

; 1920 x 1080
; global x1 = 1142	; 1st column
; global x2 = 1206	; 2nd column
; global x3 = 1270	; 3d column
; global y1 = 968   	; 1st row - items
; global y2 = 1014	; 2nd row - items
; global y3 = 1055    ; 3d row - backpack	  


; Functions
;=======================================================================

; Repeater 
repeater(key, host)
{	
  Loop
  { 
	Send, {%key%}
    sleep 10
    If (!GetKeyState(host,"p"))
      break
  } 
}


; Human delay
delay()
{	
  ; Random, delay, 50,  100
  ; Sleep, delay
  Sleep, 50
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
	;Sleep,200
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up}	
}
dragr(x2,y2,x1,y1)
{ 		
	;Sleep,200
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} ; reversed	
}


; Press item/ability
item(i)
{	
	delay()
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
	delay()
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
	Sleep, 100
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



; LWin:: 
; return

; Pause / Unpause Script
Numpad0::
	suspend
	SoundPlay, sounds/scan.mp3
return

; Right click spammer (10ms delay)
$f4::  
  repeater("RButton","f4")	 
return



; Resend courier to the next available teamate
; This is valid for 1600 x 900 only 
LAlt & `::
{
	mousegetpos,x,y
	
	; Click on the courier icon 
	
	;Click, right, 1514, 875 ; 1680x900		
	Click, right, 1890, 1500 ; 1920x1080   
	
	; Check coordinates of the 1st ally 
	
	MouseMove, 1514, 816  	; 1680x900		
	; MouseMove, 1890, 968 	; 1920x1080   
	Sleep, 250
	
	PixelGetColor, check, 1514, 816, RGB ; 1680x900	
	; PixelGetColor, check, 1890, 968, RGB ; 1920x1080   		
	if check != 0xEAE9E91
	{
		Click, 1514, 816 ; 1680x900	
		; Click, 1890, 968 ; 1920x1080  
	}	
	mousemove,%x%,%y%
}
return


; dota_select_hero npc_dota_hero_grimstroke
; Left::
    ; While GetKeyState("Left","p")
    ; {
        ; Send, {Up}
		; Send, {Enter}
        ; Sleep, 10
    ; }    
; return