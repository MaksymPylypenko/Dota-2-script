# Dota-2-script
Autohotkey scripts.

## Concerns 
* Autohotkey scripts are currently **prohibited** in proffesional dota 2 games.
* You might need to change some global variables in **utility.ahk** to match your in-game hotkey, since there is no user interface yet.
* Some scripts compare pixels on the screen. Unless your resolution is 1600 x 900, you might need to use Window Spy to find your own locations and colours. Unfortunately, pixels may also have different values depending on the graphics API used (directX, OpenGl, Vulkan).

## Set-up
- You need to have [**AutoHotkey**](https://autohotkey.com/download/) installed to execute **.ahk** files.
- To run - open any **.ahk** file. An appropriate icon should appear in the system tray (area near clocks). 
## Default hotkeys:

#### Pause / unpause the script.
> Numpad0

#### Switch between custom scripts. 
> Numpad2 - Numpad9 

#### Reset to default script.
> Numpad1 

#### Right click spammer.
> LWin 

#### Extra hotkey.
> CapsLock
- capslock is remmaped to `/`.
- can be used as an extra hotkey.

#### Resend a courier to the next available teammate.
`requires proper coordinates and pixel colours`
> ALT + ~ 

## Default functions:
  
#### Repeater( key, host )
Repeats the same key with a 50 ms delay. Can be affected by your ping and network quality.

Examples of using:
* pickup rune or aegis. 
* blink after rearm.

#### Direct( )
A "quick" directional move. Instead of holding a key before cliking, just click once. Mostly used in directItem( i ) and directAbility( i ).

Examples of using:
* raze on shadow fiend. 
* jump on slark / mirana.
* rp on magnus. 
* forcestuff.

#### Backpack( i ) 
Uses drag(x1,y1,x2,y2) to move an item with a cursor (requires proper coordinates). Allows to quickly use an item from a backpack (near fontain / shop). Alternative version - backpackL( i ), it restores mouse position at the end. 

There are also item( i ) and ability ( i ) for convinience. They simply use an item or ability at index i. Mapped to hotkeys in a config section.

Examples of using:
* bottle on any hero (as 7th slot) near fontain.
* bkb on spectre (as 7th slot) near fontain. 


<h2>Earth.ahk  <img style="-webkit-user-select: none;" src="https://d1u5p3l4wpay3k.cloudfront.net/dota2_gamepedia/1/1f/Earth_Spirit_minimap_icon.png?version=338508a1c39498cee5fa3bb7f6aaf2c7"> 
</h2>
  
#### Blink-safe boulder smash 
> alt + q 
- Places a stone and uses boulder smash.
- There is a small delay to avoid a selfcast bug after using blink dagger.
    - if stone is placed too quickly after blink it will be placed on the old location 

#### 1 stone 2 spells 
> alt + w 
- boulder (q) and rolling (w) using 1 stone only.
- note that this combo is less effective in **7.20**.
  - slow duration is wasted. 
  - also not possible to replicate slow to other heroes under magnetize. 


<h2>Sf.ahk  <img style="-webkit-user-select: none;" src="https://d1u5p3l4wpay3k.cloudfront.net/dota2_gamepedia/0/00/Shadow_Fiend_minimap_icon.png?version=e23a8fbdbc353ca25c2e169ee2ee195e"> 
</h2>

#### Directed raze 
> alt + q 

> alt + w 

> alt + e

- uses directional move to direct the hero, follows with raze and attack hotkey
- there is a 100 ms delay after directional move for proper execution during autoattack 
    - otherwise the directional move click could be ignored 


<h2>Tinker3.ahk  <img style="-webkit-user-select: none;" src="https://d1u5p3l4wpay3k.cloudfront.net/dota2_gamepedia/1/1b/Tinker_minimap_icon.png?version=0a42750ce18979d6d476eed5a2c7bcc4">
</h2>

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


<h2>Kunka.ahk  <img style="-webkit-user-select: none;" src="https://d1u5p3l4wpay3k.cloudfront.net/dota2_gamepedia/5/5b/Kunkka_minimap_icon.png?version=e9293220d87c521d719f05dec9bcd668">
</h2>

#### Timings: 
- 4000 ms - max duration of x-mark.  
- 400 ms - torrent, x-mark cast animation. 
- 1600 + 400 = 2000 ms - effective impact delay for torrent. 
- 2000 - 400 = 1600 ms - wait after torrent to return with x-mark.
- 4000 - 1600 = 2400 ms - the longest possible time to use gapless torrent after using x-mark (no return). 
#### X-mark into torrent combo:
> alt + d 
- The script uses torrent and waits exectly 1600 ms to return an enemy with x-mark. 
- However, you should keep in mind that you are not allowed to wait longer than 2400 ms for proper execution.  
- Note that x-mark debuff duration can be checked by clicking the unit on which it is applied. 
- It is also not obvious wether we will be able to return an enemy or not (can always get stunned). Use it wisely.

#### X-mark into ghostship into torrent combo:
> alt + f
- This combo is more situational and is much easier to execute by hand.
- Simply use ghost ship, return with x-mark when it almost hits and immedietly use torrent.
- I would not reccomend using a script for this one ... 

