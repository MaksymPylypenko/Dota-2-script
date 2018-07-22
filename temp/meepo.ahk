#Include %A_ScriptDir%/utility.ahk
#CommentFlag //


short_delay()
{	
  Random, delay, 30, 70
  Sleep, delay
}


poof(i)
{ 	
	Send, {%i%} 
	short_delay()	
	Send, w
	short_delay()	
}

selfpoof(i)
{
	Send, {%i%} 
	short_delay()	
	Send, !w
	short_delay()	
}

restore(m1,m2,m3,m4)
{
	if m1 = 0xFFFFFF  
	{
		if m2 = 0xFFFFFF
		{
			send, 4
		}
		else 
		{
			send, 1
		}
	}
	
	else if m3 = 0xFFFFFF 
	{
		if m4 = 0xFFFFFF
		{
			send, 5
		}
		else 
		{
			send, s
		}
	}	
	
	else if m2 = 0xFFFFFF
	{
		send, a
	}	
	
	else if m4 = 0xFFFFFF
	{
		send, d
	}
	
	else
	{
		send, 1
	}
}

// Inclusive Poof
LAlt & q::  
	PixelGetColor, m1, 71, 126, RGB	
	PixelGetColor, m2, 71, 191, RGB	
	PixelGetColor, m3, 71, 255, RGB	
	PixelGetColor, m4, 71, 319, RGB	
	
	//msgbox, color(%m2%)	
	
	if m1 = 0xFFFFFF
	{
		poof("1")
	}
		
	if m2 = 0xFFFFFF
	{
		poof("a")
	}
		
	if m3 = 0xFFFFFF
	{ 
		poof("s")
	}	
	
	if m4 = 0xFFFFFF
	{
		poof("d")	
	}	
	
	restore(m1,m2,m3,m4)
return


// Exclusive Poof
LAlt & w:: 
	PixelGetColor, m1, 71, 126, RGB	
	PixelGetColor, m2, 71, 191, RGB	
	PixelGetColor, m3, 71, 255, RGB	
	PixelGetColor, m4, 71, 319, RGB	
	
	//msgbox, color(%m2%)	
	
	if m1 != 0xFFFFFF
	{
		poof("1")
	}
		
	if m2 != 0xFFFFFF
	{
		poof("a")
	}
		
	if m3 != 0xFFFFFF
	{ 
		poof("s")
	}	
	
	if m4 != 0xFFFFFF
	{
		poof("d")	
	}
	
	/////	
	restore(m1,m2,m3,m4)	
return


// Inclusive SelfPoof
LAlt & e::
	PixelGetColor, m1, 71, 126, RGB	
	PixelGetColor, m2, 71, 191, RGB	
	PixelGetColor, m3, 71, 255, RGB	
	PixelGetColor, m4, 71, 319, RGB	
	
	//msgbox, color(%m2%)	
	
	if m1 = 0xFFFFFF
	{
		selfpoof("1")
	}
	if m2 = 0xFFFFFF
	{
		selfpoof("a")
	}
	if m3 = 0xFFFFFF
	{
		selfpoof("s")
	}
	if m4 = 0xFFFFFF
	{
		selfpoof("d")
	}
	
	restore(m1,m2,m3,m4)
	
return 

LAlt & r::
	send, 1
	short_delay()
	Click, right, 400, 250
	short_delay()

	send, a
	short_delay()
	Click, right, 1200, 250
	short_delay()
	
	send, s
	short_delay()
	Click, right, 400, 650
	short_delay()
	
	send, d
	short_delay()
	Click, right, 1200, 650
	short_delay()
return 

// 1::a
// 2::s
// 3::d 
// 4::f

// a::6
// s::7
// d::8
// f::9
