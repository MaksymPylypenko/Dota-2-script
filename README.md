# Dota-2-script
Autohotkey scripts

## Concerns 
* There is no UI to set your specific hotkeys yet.. You might need to change some global variables in utility.ahk to match your in-game hotkeys
* Some scripts compare pixels on the screen. Unless your resolution is 1600 x 900, you might need to use Window Spy to find your own locations and colours. Moreover, pixels may have different values depending on the graphics API used: directX vs OpenGl vs Vulkan. 

## Set-up
1. Install [**AutoHotkey**](https://autohotkey.com/download/).
2. Run **utility.ahk**.

## Customize  
- **utility.ahk** contains functions and hotkeys that you might use for any hero.
- `#Include %A_ScriptDir%/utility.ahk` at the top of your custom script, if you want to reuse the following functions... 

### Default hotkeys:
- pause / unpause the script
> Numpad0

- right click spammer
> LWin 

- capslock is remmaped to `/`
- can be used as an extra hotkey
> CapsLock

- resend courier to the next available teamate
- requires **proper coordinates and pixels colours**
> ALT + ~ 

### Default functions:
#### repeater( key, host )
Repeats the same key (50 ms delay). Requires a low ping. Might not work properly if ALT is pressed.

Examples of using:
* pickup rune or aegis. 
* blink after rearm / reincarnation.

#### direct( )
A "quick" directional move. Instead of holding a key before cliking, just click once. Mostly used in directItem( i ) and directAbility( i ).

Examples of using:
* raze on shadow fiend. 
* jump on slark / mirana.
* rp on magnus. 
* forcestuff.

#### backpack( i ) 
Uses drag(x1,y1,x2,y2) to move an item with a cursor (requires proper coordinates). Allows to quickly use an item from a backpack (near fontain / shop). Alternative version - backpackL( i ), it restores mouse position at the end. 

There are also item( i ) and ability ( i ) for convinience. They simply use an item or ability at index i. Mapped to hotkeys in a config section.

Examples of using:
* bottle on any hero (as 7th slot) near fontain.
* bkb on spectre (as 7th slot) near fontain. 

# earth.ahk 
### blink-safe boulder smash 
- Uses boulder smash
- Prevents placing a stone in a previous location after using blink (need to have a small delay)
> alt + q 
### 1 stone 2 spells 
- boulder (q) and rolling (w) using 1 stone only.
- note that this combo is less effective in **7.20**
  - slow duration is wasted. 
  - also not possible to replicate slow to other heroes under magnetize. 
> alt + w 

# sf.ahk 
### directed raze 
- directs the hero and uses raze 
- usefull when standing near edges 
> alt + q or w or e

# tinker3.ahk
- requires **proper coordinates and pixels colours**

### drop
1. drop items (shift queue during rearm).
2. find bottle and use it.
3. drop everything that gives you mana.

> alt + d

### pickup
1. pickup items (after rearm).
2. find soul-ring and use it.
3. find bottle and use it.
4. pickup dropped items in the original order (hopefully).

> alt + f 

# kunka.ahk
### timings: 
- 4000 ms - max duration of x-mark  
- 400 ms - torrent, x-mark cast animation 
- 1600 + 400 = 2000 ms - effective impact delay for torrent. 
- 2000 - 400 = 1600 ms - wait after torrent to return with x-mark.
- 4000 - 1600 = 2400 ms - the longest possible time to use gapless torrent after using x-mark (no return) 
### x-mark into torrent combo:
- The script uses torrent and waits exectly 1600 ms to return an enemy with x-mark. 
- However, you should keep in mind that you are not allowed to wait longer than 2400 ms for proper execution.  
- Note that x-mark debuff duration can be checked by clicking the unit on which it is applied. 
- It is also not obvious wether we will be able to return an enemy or not (can always get stunned). Use it wisely 
> alt + d 
### x-mark into ghostship into torrent combo:
- This combo is more situational and is much easier to execute by hand.
- Simply use ghost ship, return with x-mark when it almost hits and immedietly use torrent.
- I would not reccomend using a script for this one ... 
> alt + f 
