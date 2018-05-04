#Include %A_ScriptDir%/utility.ahk
#CommentFlag //

// x1 = 950	   x2 = 1000	x3 = 1055	y1 = 800	y2 = 845	y3 = 880


// Mana abuser
LAlt & d::
{   
	// Config      
    x1 = 950	   // 1st column
    x2 = 1000	   // 2nd column
    x3 = 1055	   // 3d column
    y1 = 800	   // 1st row - items
    y2 = 845	   // 2nd row - items
    y3 = 880       // 3d row - backpack	
	
    // 1st item, cooldown hover coordinates
    x1hover = 941  
    y1hover = 793

    bottle_label_x3 = 1045
    bottle_label_y2 = 835 

    // min mana treshhold 
    x1mana = 865
    y1mana = 881

    soulring1 = false
    soulring1hover = false
    bottle2 = false
    bottle6 = false
    mana = false
    
    // drop location
    mousegetpos,x,y	
    
    // Check conditions ...    
    PixelGetColor, mana, %x1mana%, %y1mana%, RGB	
	PixelGetColor, check, %x1hover%, %y1hover%, RGB	
	PixelGetColor, slot1, %x1%, %y1%, RGB
	PixelGetColor, slot6_label, %bottle_label_x3%, %bottle_label_y2%, RGB	
	PixelGetColor, slot6, %x3%, %y2%, RGB	
		
	if mana = 0x4971E7
	{
		mana = true
	}
    if check = 0x27272D
	{
        soulring1hover = true
    }
    if slot1 = 0x23120C 
	{
        soulring1 = true
    }     
    if slot6_label = 0x640B0B
	{
        bottle6 = true
    }    
    if slot6 = 0x57BACE
	{
        bottle6 = true
    }

    ////////////////////////////////////////////////////////////
    // Decide what to do...    
    ////////////////////////////////////////////////////////////
  	
	Send {Shift Down}  
	
	//CASE 1 SOULRING IN CD, 1st slot 	
	if soulring1hover = true 
	{
		if bottle6 = true 
		{
			item(6) //use bottle
		}	
		else 
		{
			swap() //use bottle form backpack
		}
		rearm()		

	
		if bottle6 = true 
		{
			item(6)
		}   
		else
		{
			drag(x3,y2,x,y)	//drop slot6	
			y-=15
		}
		drag(x3,y1,x,y) //drop slot2		
		y-=15		
		drag(x2,y1,x,y)	//drop slot3
		
	}
	//CASE 2 SOULRING IS "READY", 7th slot
	else if soulring1 = false
	{		
		drag(x3,y1,x,y)	//drop slot3
		y-=15
		drag(x3,y2,x,y)	//drop slot6

		drag(x1,y3,x1,y1)
		drag(x2,y3,x2,y1)
		item(1)
		item(2)		
	}  	
	
	Send {Shift Up}   
	Sleep, 50		
}
return

LAlt & f::
{    		
	if soulring1hover = true 
	{
		item(1)    
		mousemove, x,y    		
		pickup() 	
		if bottle6 = true
		{
			item(6)
		}
		else
		{
			swap()
		}
	}
	else 
	{
		item(2)		
		dragr(x2,y3,x2,y1)
		mousemove, x,y    
		pickup()
		
	}
}
return

swap()
{    	
	// Config      
    x1 = 950	   // 1st column
    x2 = 1000	   // 2nd column
    x3 = 1055	   // 3d column
    y1 = 800	   // 1st row - items
    y2 = 845	   // 2nd row - items
    y3 = 880       // 3d row - backpack	
	
	drag(x2,y3,x2,y2)
	Sleep, 50	
	item(5)	
	drag(x2,y3,x2,y2)
}


////////////////////////////////////////////////////////////////////	


// Pick up items back	
pickup()
{	 
	loop, 5
	{
		Click, x, y, right       
		Sleep, 50
	}	    
}

// Drag item
drag(x1,y1,x2,y2)
{ 		
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} 
}
dragr(x2,y2,x1,y1)
{ 		
	SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up} 
}

// Press item
item(i)
{		
    // Put your item hotkeys here

    item1 = z
    item2 = x
    item5 = c
    item4 = t
    item3 = {WheelUP}	
    item6 = {WheelDown}	

    Sleep, 100

	if i = 1
		Send, %item1%
	else if i = 2
	{	
		Send, %item2% 
	}
    else if i = 3
	{	
		Send, %item3% 
	}
    else if i = 4
	{	
		Send, %item4% 
	}
    else if i = 5
	{	
		Send, %item5% 
	}
    else if i = 6
	{	
		Send, %item6% 
	}	
}

rearm()
{
    Sleep, 100
    Send, r 
}