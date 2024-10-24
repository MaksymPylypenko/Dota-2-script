# Dota-2-script
An alternative to in-game cfg scripts.

> Autohotkey v1.1 was deprecated, will eventually move to 2.0. See `./ahk_2`

<h3><img style="-webkit-user-select: none; width:25px" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/idle.png"> Utility.ahk</h3> 

This file contains scripts that can be used in every game.

### Save aegis / buyback cooldown
> You can modify the code and make it even more fancy, e.g. by returning `expires 28:13, respawns 31:13-34:13`. But I prefer a minimal version.
1. Click on the time to save it in the chat. 
2. When you are not busy, type an optional *label* and a previously *saved time* in chat E.g.
   * `rosh 2313`
   * `2313` 
   * `rosh 2510, am 2313`
4. Press `LControl` + `Numpad5` (aegis expiry time) or `Numpad8` (buyback cooldown). 
5. Only the last 4 characters will be modified! The updated time will be saved to your clipboard and you can recover it with `ctrl+v`. 
   * `rosh 2813`
   * `2813` 
   * `rosh 2510, am 3113`

``` Autoit
incrementAndSaveClipboard(delta){
  Send "^a"
  Sleep 50
  Send "^x"
  Sleep 50

  ClipWait 0.5  ; Wait for the clipboard to contain data
  clipboard := A_Clipboard
  _variable := SubStr(clipboard, -4)
  if (!_variable){
    return
  }
  ; Check if the substrings for minutes and seconds are numeric
  _minutes := SubStr(_variable, -4, 2)
  _seconds := SubStr(_variable, -2, 2)
  if (!IsNumber(_minutes) or !IsNumber(_seconds)){
    ;MsgBox "Clipboard does not contain a valid time format."
    return
  }
  _minutes += delta  ; Increment minutes by delta
  newMinutes := SubStr("00" . _minutes, -2)
  newTime := newMinutes . _seconds
  
  _strLen := StrLen(clipboard)
  if (_strLen <= 4){
    A_Clipboard := newTime
  }
  else {
    restLen := _strLen - 4
    restStr := SubStr(clipboard, 1, restLen)
    result := restStr . newTime
    A_Clipboard := result
  }
}
```

### Quick directional move
> This is similar to a quick attack / move, but for a directional move. It will force the hero to move in a straigt line without looking for the shortest path.

* Make sure your config object includes your ingame directional move hotkey. For example: `config.directional_move := "h"`
* This should ideally be mapped to a rarely used key, so it doesn't interfere with the chat.
* One of my mouse hotkeys is mapped to `home`, but you can replace it with XButton1 / XButton2 / LWin etc

#### Usage 
 1. Abilities: slark's pounce, sf's raze, mirana's leap...
 2. Other: forcestuff, placing an obs from trees...
 
``` Autoit
direct() {  	
  Send "{" config.directional_move " down}{Click R}{" config.directional_move " up}"   
}
``` 
 

### Hotkey remap
> You can remap certain hotkeys to prevent them from interfering with the game
``` Autoit
CapsLock:: .
$LWin::M
```
> Additionaly you can make sure the capslock is always turned off when the script is active
``` Autoit
SetCapsLockState "AlwaysOff"
```

### Repeater
> This will spam right clicks every 20ms when you hold `LAlt` + `g` 
#### Usage
1. pick up runes/aegis.
2. steal items/runes/aegis during ember's w
3. creep block

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
This will place a stone and use boulder smash. There is a small delay to avoid a selfcast bug after using blink dagger (e.g otherwise the stone could be placed in a pre-blink location). 
* `Alt` + `q` 

#### Invisible stone
`make sure the hero is watching towards the enemy and there is no rotational animation`

There is a specific timing that allows to consume a stone that was just pushed, making the stone invisible and effectively casting 2 spells using 1 stone only. This is only usefull if you don't have enough stones or your ultimate is on cooldown. You usually don't want to waste slow duration at the expense of stun duration. Additionally all units under magnetise will share the slow from Q (that is Q after R is generally better).
* `Alt` + `w` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/sf.png"> sf.ahk</h2>

#### Directed raze 
Uses directional move to direct the hero, follows with a raze and an attack.
* `Alt` + `q` or `w` or `e` 

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/invoker.png"> invoker.ahk</h2>

#### Click a sphere 3 times
This allows to avoid tedious non-stop clicking to maximize regen & damage during laning stage or after casting a spell.
* `Alt` + `q` or `w` or `e`

<h3><img style="-webkit-user-select: none;" src="https://github.com/MaksymPylypenko/Dota-2-script/blob/master/icons/veno.png"> veno.ahk</h2>

#### Plague Ward Auto Attack: `Standard`
This allows to send a unified unit order (e.g. Cancel Current Action) without holding CTRL. Helps with last hitting on the lane.
* `Space`
