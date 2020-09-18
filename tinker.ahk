I_Icon = icons/tinker.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

global x
global y
global soulringIndex
global bottleIndex
global soulringActive


; Config 
;=======================================================================

; You might need to use WindowSpy to find your own coordinates and colour
; They depend on your resolution and rendering API 

Set1920x1080(void)
{
	global			
	soulring1X := 1129
	soulring1Y := 952
	soulring1C_cool_down := 0x27272F
	soulring1C_active := 0x4A4A6D	
	bottle2X := 1193
	bottle2Y := 951
	bottle2C := 0x960F0B
	bottle6X := 1258
	bottle6Y := 1003
	bottle6C := 0x533135
	return
}

Set1600x900(void)
{
	global	
	soulring1X := 938
	soulring1Y := 793
	soulring1C_cool_down := 0x9F6F69    ; cool down soul ring black pixel on slot 1
	soulring1C_active := 0x974512		; active soul ring black pixel on slot 1
	bottle2X := 992
	bottle2Y := 792						
	bottle2C := 0x43A7BD				; bottle red pixel on slot 2 
	bottle6X := 1045
	bottle6Y := 835
	bottle6C := 0x0E9BBE				; bottle red pixel on slot 6 
	return
}


; Hotkeys 
;=======================================================================


; Blink spammer, replace t with your blink hotkey
LAlt & t::
	repeater("t","t") 
return


; Directional rearm - blink
; LWin:: 
	; direct() 
	; sleep, 100
	; send, t
	; ability(6)
	; repeater("t","LWin") 
; return


; Drop items during rearm
LAlt & d::
{
	Set1600x900(void)
	
	Send {Shift Down}
	delay() 
	mousegetpos,x,y	; save mouse position
	
	; find bottle and use it 		
	bottleIndex = -1	
	
	; check the colour of a red pixel, it is the same for both empty and full bottle states		
	PixelGetColor, bottle6, bottle6X,bottle6Y, RGB 	
	PixelGetColor, bottle2, bottle2X,bottle2Y, RGB 		
	;Msgbox, "%bottle6%" 
		
	; I assume there are 2 possible positions for a bottle 	
	if bottle2 = %bottle2C%
	{
		item(2)
		bottleIndex = 2
	}
	
	if bottle6 = %bottle6C%
	{
		item(6)
		bottleIndex = 6
	}	
	
	; otherwise it is in backpack
	if bottleIndex = -1 
	{
		backpackL(2)
	}
	
	; I assume there is 1 possible position for a soul ring 
	soulringIndex = -1
	soulringActive = -1
		
	PixelGetColor, soulring1, soulring1X,soulring1Y, RGB 	
	;Msgbox, "%soulring1%"  		
	
	if soulring1 = %soulring1C_cool_down%
	{		
		soulringIndex = 1		
	}		
	else if soulring1 = %soulring1C_active%
	{		
		soulringIndex = 1 
		soulringActive = 1
	}	
	else ; need an extra check.. active soulring might have a hover effect
	{
		Sleep, 100		
		PixelGetColor, soulring1, soulring1X, soulring1Y, RGB 	
		
		if soulring1 = soulring1C_active		
		{
			soulringIndex = 1
			soulringActive = 1
		}
	}
	
	if soulringActive != 1 ; if soul-ring is active, we dont need rearm yet
	{
		;   can rearm
		Sleep, 50
		ability(6)
		Sleep, 50 ; make sure rearm was pressed 
	}
		
	; I assume that 2 slot are never used (e.g. 4-blink ,5-travels)
	; drop any item that gives mana (last item first!) 	
	if bottleIndex != 6
	{
		drop(6)
	}
	if bottleIndex != 3
	{
		drop(3)
	}	
	if bottleIndex != 2
	{
		drop(2)
	}	
	if soulringIndex != 1
	{
		if soulringActive != 1
		{
			drop(1)
		}		
	}		
			
	Send {Shift Up}	
} 
return
  

; Pick up items back	
LAlt & f::
{	 
	; efficient use of soulring 
	if soulringIndex != -1
	{
		item(soulringIndex) ; assuming that soul-ring is in the 1st slot
	}
	else
	{
		backpackL(1)
	}
	
	; efficient use of bottle
	if bottleIndex != -1
	{
		item(bottleIndex) ; assuming that soul-ring is in the 1st slot
	}
	else
	{
		backpackL(2)
	}
	
	; now we can pickup 
	loop, 5
	{		
		Click, right       
		Sleep, 60			
		x+=15
		mousemove x,y
	}			
}
return



; Functions
;=======================================================================

 ; drop an item
drop(i)
{
	if i = 1
	{
		drag(x1,y1,x,y)
	}
	else if i = 2
	{	
		drag(x2,y1,x,y)
	}
    else if i = 3
	{	
		drag(x3,y1,x,y)
	}
    else if i = 4
	{	
		drag(x1,y2,x,y)
	}
    else if i = 5
	{	
		drag(x2,y2,x,y)
	}
    else if i = 6
	{	
		drag(x3,y2,x,y)
	}	
	;y-=15
	x-=15
}