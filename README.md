# Dota-2-script
An alternative to in-game cfg scripts. 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/dota2.png"> Utility.ahk</h3>
This file contains scripts that can be used in every game. Make sure you have Autohotkey installed and your ingame hotkeys are set properly in the script.

### A quick way to save roshan's respawn time
Whenever Roshan dies, click on the time to save it in the chat. When you are not busy type a previously saved time (e.g. `23:13`) in chat and press `LControl` + `/`. Your input will be replaced with `expires 28:13, respawns 31:13-34:13`. This will also be saved to clipboard, so whenever you press ctrl+v you will see the same text. This is helpful since the chat only shows the last few messages and your roshan timing could be lost.

``` Autoit
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
2. steal items/runes/aegis during ember's w
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

## Hero specific scripts
You can also create your own custom scripts. Simply create a new `.ahk` in the root directory and import the main script like this:
``` Autoit
#Include %A_ScriptDir%/utility.ahk
#SingleInstance force
```
You may also add a new icon:
``` Autoit
I_Icon = icons/arc.png
```

#### Switching between scripts
For convenience there are several shortcuts in the main script that switch between scripts. For example, 
* `Alt`+ `Numpad1` will chnage to **utility.ahk**
``` Autoit
^Numpad1:: 
Run "utility.ahk" 
ExitApp
return
```
* `Alt`+ `Numpad2` will chnage to **tinker.ahk**
``` Autoit
^Numpad2:: 
Run "tinker.ahk" 
ExitApp
return
```

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/earthspirit.png"> earth.ahk</h3>
  
#### Blink-safe boulder smash 
> alt + q 
- Places a stone and uses boulder smash.
- There is a small delay to avoid a selfcast bug after using blink dagger.
    - if stone is placed too quickly after blink, it will be placed on the old location. 

#### 1 stone 2 spells 
> alt + w 
- boulder (q) and rolling (w) using 1 stone only.
- note that this combo is less effective in **7.20**.
  - slow duration is wasted. 
  - also not possible to replicate slow to other heroes under magnetize. 


<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/sf.png"> sf.ahk</h2>

#### Directed raze 
> alt + q 

> alt + w 

> alt + e

- uses directional move to direct the hero, follows with a raze and an attack hotkey


<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/invoker.png"> invoker.ahk</h2>

#### Click a sphere 3 times

> alt + q 

> alt + w 

> alt + e

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/magnus.png"> magnus.ahk</h2>

#### Directed rp 
> alt + r 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/ember.png"> ember.ahk</h2>

#### Fist & Chain combo
Make sure the hero is watching towards the enemy and there is no rotational animation. A directional move may help direct the hero.
> alt + w

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/tinker.png"> tinker.ahk</h3>

`requires proper coordinates and pixel colours`

#### Drop
> alt + d
1. drop items (shift queue during rearm).
2. find bottle and use it.
3. drop everything that gives you mana.

#### Pickup
> alt + f 
1. pickup items (after rearm).
2. find soul-ring and use it.
3. find bottle and use it.
4. pickup dropped items in the original order (hopefully).


<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/kunka.png"> kunka.ahk</h3>
 
#### X-mark into torrent combo:
> alt + d 
- Use torrent and wait exectly 1600 ms to return an enemy with x-mark. 
- The **latest time** to return is **2000ms** out of 4000ms, after this point the return cast animation will be interrupted and the torrent will be 0-400 ms (cast animation) late.

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/arc.png"> ark.ahk</h3>

`requires proper coordinates`

`turn on autoselect summoned units`

#### The issue: 
Arc's and Tempest Double's necro book can not be pernamently assigned to different hotkeys. Thus, it is not trivial to send both necro books on different camps relatively quickly.

#### Quick bind:
If you have a hero and 2 summons selected, deselects the first unit (e.g. Arc or Tempest Double) and binds the rest to a specific hotkey.

> alt + z 
- bind book 1 to `A`
> alt + x 
- bind book 2 to `S`
