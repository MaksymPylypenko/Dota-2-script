# Dota-2-script
An alternative to in-game cfg scripts. 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/dota2.png"> Utility.ahk</h3>
This file contains scripts that can be used in every game. Make sure you have Autohotkey installed and your ingame hotkeys are set properly in the script.

### A quick way to save roshan's respawn time
* Whenever Roshan dies, click on the time to save it in the chat. When you are not busy type a previously saved time (e.g. `23:13`) in chat and press `LControl` + `/`. Your input will be replaced with `expires 28:13, respawns 31:13-34:13`. This will also be saved to clipboard, so whenever you press ctrl+v you will see the same text. This is helpful since the chat only shows the last few messages and your roshan timing could be lost.

#### Code
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
`an ingame directional move hotkey should be assigned in the config`

This is similar to a quick attack / move, but for a directional move. It will force the hero to move in a straigt line without looking for the shortest path.
* `XButton2` 

``` Autoit
XButton2::
	direct()
 return 
```
#### Usage 
 1. Abilities: slark's pounce, sf's raze, mirana's leap...
 2. Other: forcestuff, placing an obs from trees...

#### Code
``` Autoit
global directional_move = "h"
direct()
{  	
  Send, {%directional_move% Down}{Click, R}{%directional_move% Up}       
}
``` 
 

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
This will spam right clicks every 25ms. 
* `LAlt` + `g` 

``` Autoit
LAlt & g::
   repeater("RButton","g")
return
```

#### Usage
1. pick up runes/aegis.
2. steal items/runes/aegis during ember's w
3. creep block

#### Code
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

### Switching between scripts
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
This will place a stone and use boulder smash. There is a small delay to avoid a selfcast bug after using blink dagger. Otherwise if a stone is placed too quickly it will be placed in the previous location (before blink). 
* `Alt` + `q` 

#### Invisible stone
`make sure the hero is watching towards the enemy and there is no rotational animation`

There is a specific timing that allows to consume a stone that was just pushed, making the stone invisible and effectively casting 2 spells using 1 stone only. This is only usefull if you don't have enough stones or your ultimate is on cooldown. You usually don't want to waste slow duration at the expense of stun duration. Additionally all units under magnetise will share the slow from Q (that is Q after R is generally better).
* `Alt` + `w` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/sf.png"> sf.ahk</h2>

#### Directed raze 
Uses directional move to direct the hero, follows with a raze and an attack hotkey.
* `Alt` + `q` or `w` or `e` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/invoker.png"> invoker.ahk</h2>

#### Click a sphere 3 times
This allows to avoid tedious non-stop clicking to maximize regen & damage during laning stage or after casting a spell.
* `Alt` + `q` or `w` or `e` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/magnus.png"> magnus.ahk</h2>

#### Directed RP
This spell can be casted during a rotational animation similar to sf's raze.
* `Alt` + `r` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/ember.png"> ember.ahk</h2>

#### Fist & Chain combo
`make sure the hero is watching towards the enemy and there is no rotational animation`

This allows to cast chains from a longer distance.
* `Alt` + `w`

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/tinker.png"> tinker.ahk</h3>

#### Blink spam
`make sure the hero is watching towards the blink direction`

This will spam a 4th item.
* `Alt` + `t` 

#### Mana regen on base
`requires proper coordinates and pixel colours`

First step: `Alt` + `d` 
  1. drop items (shift queue during rearm).
  2. find bottle and use it.
  3. drop everything that gives you mana.

Second step: `Alt` + `f`
  1. pickup items (after rearm).
  2. find soul-ring and use it.
  3. find bottle and use it.
  4. pickup dropped items in the original order (hopefully).

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/kunka.png"> kunka.ahk</h3>
 
#### X-mark into torrent combo:
Uses torrent and waits exectly 1600 ms to return an enemy with x-mark. The **latest time** to return is **2000ms** out of 4000ms, after this point the return cast animation will be interrupted and the torrent will be 0-400 ms (cast animation) late.
* `Alt` + `d` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/arc.png"> ark.ahk</h3>

#### Necro book bind:
`requires proper coordinates` + `turn on autoselect summoned units`

Arc's and Tempest Double's necro book can not be pernamently assigned to different hotkeys. But you can still bind thwm every time you summon them. If you have a hero and 2 summons selected, deselects the first unit (e.g. Arc or Tempest Double) and binds the rest to a specific hotkey.

* `Alt` + `z` deselects the first unit & binds the rest to `A`
* `Alt` + `x` deselects the first unit & binds the rest to `S`
