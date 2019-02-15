; Default script

#NoEnv
#SingleInstance force
SendMode Input 
SetWorkingDir %A_ScriptDir%  
SetNumlockState, AlwaysOn
SetCapsLockState, Off


; Config 
;=======================================================================

global item1 = "z"
global item2 = "0"
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
global attack = "g"
global stop = "space"

; Use Window Spy to find your coordinates

; 1600 x 900 Direct3D -dx9
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


; Switcher - assign your most frequently used scripts
;=======================================================================

I_Default = icons/dota2.png

IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
IfNotExist, %I_Icon%
  Menu, Tray, Icon, %I_Default%

^Numpad1:: 
I_Icon = icons/invoker.png
Run "utility.ahk" 
ExitApp
return

^Numpad2:: 
Run "tinker3.ahk" 
ExitApp
return

^Numpad3:: 
Run "inv.ahk" 
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
Run "arc.ahk" 
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
    sleep 10
    If (!GetKeyState(host,"p"))
      break
  } 
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

; Extra hotkey.
; --------------------------------------------
; If you remap Capslock, you can use it as an extra hotkey

CapsLock:: /


; Pause / Unpause Script
; --------------------------------------------
; You can freeze the script, if something went horribly wrong :)

Numpad0::
    suspend
	SoundPlay, sounds/scan.mp3	
return

LAlt & Numpad0::	
    Reload	
return


; Right click spammer (10ms delay)
; --------------------------------------------
; LWin is pressed, Righclick is pressed every 10 ms 
; You can steal the rune or block creeps with this. 

$LWin::  
  repeater("RButton","LWin")	 
return


; Resend courier to the next available teamate
; --------------------------------------------
; Click the courier control > icon in the right bottom corner.
; If there are any teamates on the list, click on the first one.

LAlt & `::
{
	mousegetpos,x,y
	
	; Click on the courier icon 
	
	Click, right, 1514, 875 ; 1680x900		
	;Click, right, 1890, 1500 ; 1920x1080   
	
	; Check coordinates of the 1st ally 
	
	MouseMove, 1514, 816  	; 1680x900		
	;MouseMove, 1890, 968 	; 1920x1080   
	
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


; Pick a hero using console 
; --------------------------------------------

; dota_select_hero npc_dota_hero_grimstroke
; Left::
    ; While GetKeyState("Left","p")
    ; {
        ; Send, {Up}
		; Send, {Enter}
        ; Sleep, 10
    ; }    
; return