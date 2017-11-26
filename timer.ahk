#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%  
#CommentFlag //


// Glyph notification
~p::    	
	SoundPlay, sounds/pangolier.mp3
    CreateGUI("Glyph had been used", "Blue", 3000)		
	
	Sleep, 300000 // is 5 minutes 
	
	SoundPlay, sounds/glyph.mp3
	CreateGUI("Enemy's glyph is ready", "Red", 3000)	
return

// Aegis notification
~[::    	
	SoundPlay, sounds/cheese.mp3
    CreateGUI("Roshan timer is activated", "Green", 3000)		
	
	Sleep, 287000 // is 4 minutes 47 seconds
	
	SoundPlay, sounds/aegis.mp3
	CreateGUI("Aegis expires in 10 seconds", "Red", 3000)

	Sleep, 4000  

	SoundPlay, sounds/getback.mp3			
	CreateGUI(" 3 ", "Red", 1000)		
	CreateGUI(" 2 ", "Red", 1000)	
	CreateGUI(" 1 ", "Red", 1000)	
return

~]::Reload


// GUI
CreateGUI(text, c, timer){
	Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound +Owner	
	Gui, Color, %c%
	WinSet, Transparent, 180
	Gui, Font, cWhite s20 bold, Arial
	Gui, Add, Text, Center , %text% //;the text to display	
	Gui, Show, y50 NA

	sleep, timer
	Gui, Destroy
}
