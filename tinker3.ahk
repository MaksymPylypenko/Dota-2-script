#Include %A_ScriptDir%/utility.ahk

global x
global y
global soulringIndex
global bottleIndex


; Config 
;=======================================================================

; 1600 x 900
; global bottle2C = 0xB21211
; global bottle2X = 992
; global bottle2Y = 792
; global bottle6C = 0x640B0C
; global bottle6X = 1045
; global bottle6Y = 835
; global soulring1C = 0x49486A
; global soulring1X = 938
; global soulring1Y = 793

; 1920 x 1080
; global bottle2C = 0x960F0B
; global bottle2X = 1193
; global bottle2Y = 951
; global bottle6C = 0x533135
; global bottle6X = 1258
; global bottle6Y = 1003
; global soulring1C = 0x27272F
; global soulring1X = 1129
; global soulring1Y = 952


; Blink spammer, replace t with your blink hotkey
LAlt & t::
	repeater("t","t") 
return


; Drop items during rearm
LAlt & d::
{
	Send {Shift Down}
	mousegetpos,x,y	; save mouse position
	
	; find bottle and use it 		
	bottleIndex = -1
	
	; you might need to use WindowSpy to find your own coordinates and colour 
	; check the colour of a red pixel, it is the same for both empty and full bottle states
	
	
	; PixelGetColor, bottle6, 1045,835, RGB 	; 1600 x 900	
	; PixelGetColor, bottle2, 992,792, RGB  	; 1600 x 900	
	
	PixelGetColor, bottle6, 1258,1003, RGB 	; 1920x1080   	
	PixelGetColor, bottle2, 1193,951, RGB  	; 1920x1080 

	;PixelGetColor, bottle6, %bottle6X%,%bottle6Y%, RGB 	; 1920x1080   		
	;Msgbox, "%bottle6%" 
		
	; assuming that you always buy a bottle, it will either be in one of the available slots
			
	;if bottle2 = 0xB21211 ; 1600 x 900
	if bottle2 = 0x960F0B ; 1920x1080   
	{
		item(2)
		bottleIndex = 2
	}
	;if bottle6 = 0x640B0C ; 1600 x 900
	if bottle6 = 0x533135 ; 1920x1080
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
	
	;PixelGetColor, soulring1, 938,793, RGB	; 1600 x 900
	PixelGetColor, soulring1, 1129, 952, RGB	; 1920x1080	
	;Msgbox, "%soulring1%"  
	
	;if soulring1 = 0x1D1D24 ; cool-down ; 1600 x 900
	if soulring1 = 0x27272F ; cool-down ; 1920x1080	
	{		
		soulringIndex = 1
	}	
	;else if soulring1 = 0x49486A ; active ; 1600 x 900
	else if soulring1 = 0x4A4A6D ; active ; 1920x1080	
	{		
		soulringIndex = 1 
	}	
	else ; need an extra check.. active soulring might have a hover effect
	{
		Sleep, 100
		;PixelGetColor, soulring1, 938,793, RGB	; 1600 x 900
		PixelGetColor, soulring1, 1129, 952, RGB	; 1920x1080	
		;if soulring1 = 0x49486A ; active ; 1600 x 900
		if soulring1 = 0x4A4A6D ; active ; 1920x1080	
		{
			soulringIndex = 1 
		}
	}
	
	; now we can rearm
	rearm()	
	
	;Sleep, 200 
	
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