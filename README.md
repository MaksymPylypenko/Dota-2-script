# Dota-2-script
An alternative to in-game cfg scripts. 

## Utility.ahk
This file contains scripts that can be used in every game. Make sure you have Autohotkey installed and your ingame hotkeys are set properly in the script.

### A quick way to save roshan's respawn time
Whenever Roshan dies, click on the time to save it in the chat. When you are not busy type a previously saved time (e.g. `23:13`) in chat and press `LControl` + `/`. Your input will be replaced with `expires 28:13, respawns 31:13-34:13`. This will also be saved to clipboard, so whenever you press ctrl+v you will see the same text. This is helpful since the chat only shows the last few messages and your roshan timing could be lost.

```
LControl & /::
	Send, ^a
	Send, ^c
	Sleep, 100
	variable := clipboard	
	if(strlen(variable)<6){
		StringSplit, time, variable, :,
		s := time2
		m1 := time1+5
		m2 := m1+3
		m3 := m2+3		
		variable = expires %m1%:%s%, respawns %m2%:%s%-%m3%:%s% 		
		Send, ^a
		Send, %variable%
		Clipboard := variable   ; update clipboard
	}	
return
```

### Quick directional move
This is similar to a quick attack / move, but for a directional move. 
``` Autoit
global directional_move = "h"
direct()
{  	
  Send, {%directional_move% Down}{Click, R}{%directional_move% Up}       
}
```
`XButton2` is the button on the side of the mouse.
``` Autoit
XButton2::
	direct()
 return 
 ```
IMAO this must be in the client by default, since the usage examples are countless:
1. Abilities: slark's pounce, sf's raze, mirana's leap, earth spirit's roll
2. Other: forcestuff, placing an obs from trees.
 

### Capslock remap
When the script is active the capslock will always be turned off.
``` Autoit
SetCapsLockState, Off
```
Additionally you can remap it to some other hotkey to avoid writing CAPS in the chat.
``` Autoit
CapsLock:: /
```

### Repeater
Repeats a click or a button every 25ms. Usage examples:
1. pick up runes/aegis.
2. steal items/runes/aegis using ember's w
3. creep block
4. blink after rearm on tinker
``` Autoit
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
```
Holding `LAlt` + `g` will spam right click every 25ms. 
``` Autoit
LAlt & g::
   repeater("RButton","g")
return
```
