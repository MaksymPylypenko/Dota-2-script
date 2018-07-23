#Include %A_ScriptDir%/utility.ahk

global x
global y
global soulringIndex
global bottleIndex


; Blink spammer, replace t with your blink hotkey
LAlt & t::
	repeater("t","t") 
return


; Drop items during rearm
LAlt & d::
{
	; Send {Shift Down}
	mousegetpos,x,y	; save mouse position
	
	; find bottle and use it 		
	bottleIndex = -1
	
	; you might need to use WindowSpy to find your own coordinates and colour unless it is 1600 x 900	
	; check the colour of a red pixel, it is the same for both empty and full bottle states
	
	PixelGetColor, bottle6, 1045,835, RGB 	
	PixelGetColor, bottle2, 992,792, RGB  	
	; Msgbox, "%bottle2%" 
		
	; assuming that you always buy a bottle, it will either be in one of the available slots
			
	if bottle2 = 0xB21211 
	{
		item(2)
		bottleIndex = 2
	}
	if bottle6 = 0x640B0C
	{
		item(6)
		bottleIndex = 6
	}	
	
	; or in backpack
	if bottleIndex = -1 
	{
		backpackL(2)
	}
	
	; what about soul-ring... 
	soulringIndex = -1
	
	PixelGetColor, soulring1, 938,793, RGB	
	;Msgbox, "%soulring1%"
	
	if soulring1 = 0x1D1D24 ; cool-down
	{		
		soulringIndex = 1
	}	
	else if soulring1 = 0x49486A ; active
	{		
		soulringIndex = 1 
	}	
	else ; need an extra check.. active soulring might have a hover effect
	{
		Sleep, 100
		PixelGetColor, soulring1, 938,793, RGB	
		if soulring1 = 0x49486A
		{
			soulringIndex = 1 
		}
	}
	
	; now we can rearm
	rearm()	
	
	; assuming that slot 4-blink ,5-travels
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
		drop(1)
	}		
			
	; Send {Shift Up}	
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
	loop, 4
	{		
		Click, right       
		Sleep, 60			
		x+=15
		mousemove x,y
	}			
}
return


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


; Need to consider cast animation as well
rearm()
{
    ;Sleep, 100
    Send, r 	;change this to your ultimate hotkey
}