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

    bottle_label_x1 = 992
    bottle_label_y1 = 792    

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
	//msgbox, color(%check%)	
    if mana = 0x4971E7
	{
		mana = true
	}

    PixelGetColor, check, %x1hover%, %y1hover%, RGB	
    //msgbox, color(%check%)	// 0x27272D = soulring in cd
    //mousemove,%x1hover%,%y1hover%    
    if check = 0x27272D
	{
        soulring1hover = true
    }

	PixelGetColor, slot1, %x1%, %y1%, RGB	
    //msgbox, color(%slot1%)	// 0x23120C = soulring
    if slot1 = 0x23120C 
	{
        soulring1 = true
    }

    PixelGetColor, slot2, %x2%, %y1%, RGB	
    //msgbox, color(%slot2%)	// 0x0FA6C7 = bottle
    if slot2 = 0x0FA6C7
	{
        bottle2 = true
    }

    PixelGetColor, slot2, %bottle_label_x1%, %bottle_label_y1%, RGB	    
    if slot2 = 0xB11314 
	{
        bottle2 = true
    }

    PixelGetColor, slot6, %bottle_label_x3%, %bottle_label_y2%, RGB	
    //msgbox, color(%slot6%)	// 0x57BACE = bottle
    if slot6 = 0x640B0B
	{
        bottle6 = true
    }

    PixelGetColor, slot6, %x3%, %y2%, RGB	
    if slot6 = 0x57BACE
	{
        bottle6 = true
    }

    ////////////////////////////////////////////////////////////
    // Decide what to do...    
    ////////////////////////////////////////////////////////////
  
    Send {Shift Down}  
    if (soulring1hover = false || soulring1 = false)
    {   
        drag(x1,y3,x1,y1)  
    } 
    
    if bottle2 = false
    {
        if bottle6 = false
        {
            drag(x2,y3,x2,y1)
        }
        else
        {
            item(6)
        }
    }    

    if bottle6 = false
    {
        drag(x3,y2,x,y)    
    } 
    else
    {
        drag(x2,y1,x,y)    
    }

    y+=15

    drag(x3,y1,x,y)

    Sleep, 50

    item(1)

    if bottle6 = true   
        item(6)

    item(2)


    Send {Shift Up}      
}
return

LAlt & f::
{
    if (soulring1hover = false || soulring1 = false)
        dragr(x1,y3,x1,y1)

    if (bottle2 = false || bottle6 = false)
        dragr(x2,y3,x2,y1)     

    mousemove, x,y      
    pickup()

    if bottle2 = true   
        item(2)

    if bottle6 = true   
        item(6)

    
    rearm()
    
}
return


////////////////////////////////////////////////////////////////////	


// Pick up items back	
pickup()
{	        
    Click, x, y, right       
    Sleep, 50
    y-=15
    Click, x, y, right       
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
    item3 = c
    item4 = t
    item5 = {WheelUP}	
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