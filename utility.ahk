; Default script

#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%  
SetNumlockState, AlwaysOn
SetCapsLockState, Off
#Include %A_ScriptDir%/config.ahk

; Switcher - assign your most frequently used scripts
;=======================================================================

I_Default = icons/dota2.png

IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
IfNotExist, %I_Icon%
  Menu, Tray, Icon, %I_Default%

^Numpad1:: 
Run "utility.ahk" 
ExitApp
return

^Numpad2:: 
Run "tinker.ahk" 
ExitApp
return

^Numpad3:: 
Run "invoker.ahk" 
ExitApp
return

^Numpad4:: 
Run "earth.ahk" 
ExitApp
return

^Numpad5:: 
Run "meepo.ahk" 
ExitApp
return

^Numpad6:: 
Run "ember.ahk" 
ExitApp
return

^Numpad7:: 
Run "magnus.ahk" 
ExitApp
return

^Numpad8:: 
Run "sf.ahk" 
ExitApp
return

^Numpad9:: 
Run "kunka.ahk" 
ExitApp
return


; Functions
;=======================================================================

; Repeater
; --------------------------------------------
; Repeats the key when a host is pressed.
; Can be affected by your ping and network quality.
; Usage: see repeater("RButton","LWin")


repeater(key, host)
{	
  Loop
  { 
	Send, {%key%}	
	Sleep, 25
	If !getkeystate("Alt","p") 
		break
	if !GetKeyState(host,"p")
		break
  } 
  Reload
}


; Human delay
; --------------------------------------------
; Hotkeys should normally have a delay to be proccessed correctly in dota

delay()
{	
  ; Random, delay, 50,  100
  ; Sleep, delay
  Sleep, 50
}

long_delay()
{	
  Sleep, 100
}


; Quick directional move
; --------------------------------------------
; You would normally hold a key and then click if you want to use a directional move compare to just clicking when doing quick attack/follow commands. 
; direct() allows you to click once. 
;
; Examples of using:
; * raze on shadow fiend. 
; * jump on slark / mirana.
; * rp on magnus. 
; * forcestuff.

direct()
{  	
  Send, {%directional_move% Down}{Click, R}{%directional_move% Up}       
}

patrol()
{  	
  Send, {%patrol_move%}{Click}     
 ; Send, {Click}
}


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


; Drag item
; --------------------------------------------
; Allows to move items on a screen from position x1y1 to position x2y2
; Usage: see backpack(i)

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


; Press item
; --------------------------------------------
; Mapped to hotkeys in a config section.

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
; --------------------------------------------
; Mapped to hotkeys in a config section.

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


; Backpack 
; --------------------------------------------
; Allows to quickly use an item from a backpack (near fontain / shop). 
;
; Examples of using:
; * bottle on any hero (as 7th slot) near fontain.
; * bkb on spectre (as 7th slot) near fontain. 

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
	Sleep, 100	
	item(currI)
	Sleep, 150
	dragr(currX,y3,currX,y2)	
}
backpackL(i)
{
	mousegetpos,x,y   	; store mouse position 
	backpack(i)
	mousemove,%x%,%y% 	; restore mouse position
}


; Default hotkeys for all other scripts 
;=======================================================================

; Extra hotkeys
; --------------------------------------------
; If you remap Capslock, you can use it as an extra hotkey

CapsLock:: .

$LWin::  
  Send, m
return


; Pause / Unpause Script
; --------------------------------------------
; You can freeze the script, if something went horribly wrong :)

Numpad0::
  suspend
return

LAlt & Numpad0::	
    Reload	
return


; Right click spammer (10ms delay)
; --------------------------------------------
; Righclick is pressed every 10 ms 
; You can steal the rune or block creeps with this. 

LAlt & g::
	repeater("RButton","g")
return


; Quick directional move
; --------------------------------------------
 Home::
	direct()
 return 

; Save roshan timing
; --------------------------------------------

LControl & /::
	Send, ^a
	Send, ^c
	Sleep, 100
	Send, ^x
	Sleep, 100
	variable := clipboard	
	if(strlen(variable)<6){
		;StringSplit, time, variable, :,
		minutes := SubStr(variable,1,2) + 5
		seconds := SubStr(variable,3,2)
		aegisExpiryMinutes := SubStr("00" . minutes,-1)
		; m2 := m1+3
		; m3 := m2+3		
		variable = %aegisExpiryMinutes%%seconds%		
		; Send, ^a
		; Send, %variable%
		Clipboard := variable   ; update clipboard
	}	
return


