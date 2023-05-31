# Dota-2-script
An alternative to in-game cfg scripts.

> Autohotkey v1.1 was deprecated, will eventually move to 2.0. See `./ahk_2`

<h3><img style="-webkit-user-select: none; width:25px" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/idle.png"> Utility.ahk</h3> 

This file contains scripts that can be used in every game.

### A quick way to time aegis expiry or buyback cooldown
> You can modify the code and make it even more fancy, e.g. by returning `expires 28:13, respawns 31:13-34:13`. But I prefer a minimal version.
1. Click on the time to save it in the chat. 
2. When you are not busy, type an optional *label* and a previously *saved time* in chat E.g.
   * `rosh 2313`
   * `2313` 
   * `rosh 2510, am 2313`
4. Press `LControl` + `Numpad5` (aegis expiry time) or `Numpad8` (buyback cooldown). 
5. Only the last 4 characters will be considered! The updated time will be saved to your clipboard and you can recover it with `ctrl+v`. 
   * `rosh 2813`
   * `2813` 
   * `rosh 2510, am 3113`

``` Autoit
incrementAndSaveClipboard(delta){
  Send "^a"
  Sleep 50
  Send "^x"
  Sleep 50

  clipboard := A_Clipboard
  _variable := SubStr(clipboard, -4)	
  _minutes := SubStr(_variable,-4,2) + delta
  _seconds := SubStr(_variable,-2,2)
  newMinutes := SubStr("00" . _minutes,-2)
  newTime :=  newMinutes _seconds		
  ;MsgBox "newTime=" newTime

  _strLen:=StrLen(clipboard)
  if(_strLen<=4){
    A_Clipboard := newTime
  }
  else{
    restLen :=_strLen-4
    restStr := SubStr(clipboard, 1, restLen)
    result :=  restStr newTime
    A_Clipboard := result
  }  
}
```

### Quick directional move
> This is similar to a quick attack / move, but for a directional move. It will force the hero to move in a straigt line without looking for the shortest path.

* Make sure your config object includes your ingame directional move hotkey. For example: `config.directional_move := "h"`
* This should ideally be mapped to a rarely used key, so it doesn't interfer with the chat.
* One of my mouse hotkeys is mapped to `home`, but you can replace it with XButton1 / XButton2 / LWin etc

#### Usage 
 1. Abilities: slark's pounce, sf's raze, mirana's leap...
 2. Other: forcestuff, placing an obs from trees...

``` Autoit
Home::direct()
```

``` Autoit
direct() {  	
  Send "{" config.directional_move " down}{Click R}{" config.directional_move " up}"   
}
``` 
 

### Capslock & LWin remap
When the script is active the capslock will always be turned off.
``` Autoit
SetCapsLockState "AlwaysOff"
```
Additionally you can remap it to some other hotkey to avoid writing CAPS in the chat.
``` Autoit
CapsLock:: .
$LWin::M
```

### Repeater
This will spam right clicks every 20ms. 
* `LAlt` + `g` 

``` Autoit
!g:: 
{  
  while GetKeyState("g","P"){
    SendInput "{RButton}"
    Sleep 20
  }
  return
}
```

#### Usage
1. pick up runes/aegis.
2. steal items/runes/aegis during ember's w
3. creep block


## Hero specific scripts
You can also create your own custom scripts. Simply create a new `.ahk` in the root directory and import the main script like this:
``` Autoit
#Include %A_ScriptDir%/utility.ahk
#SingleInstance force
```
You may also add a new icon:
``` Autoit
TraySetIcon("../icons/arc.png", 1)
```

### Switching between scripts
For convenience there are several shortcuts in the main script that switch between scripts. For example, 
* `Alt`+ `Numpad1` will chnage to **utility.ahk**
``` Autoit
^Numpad1::{
  Run "utility.ahk" 
  ExitApp
}
```
* `Alt`+ `Numpad2` will chnage to **invoker.ahk**
``` Autoit
^Numpad2::{
  Run "invoker.ahk" 
  ExitApp
}
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
