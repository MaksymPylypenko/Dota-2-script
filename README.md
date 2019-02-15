# Dota-2-script
Allows players with a little knowledge of Autohotkey to perfom effective actions in Dota 2 without breaking into the game files.

## Concerns 
* Autohotkey scripts are currently **prohibited** in proffesional dota 2 games.
* You might need to change some global variables in **utility.ahk** to match your in-game hotkeys, since there is no user interface yet.
* Some scripts use pixel data directly from the screen. You might need to use Window Spy to find your own locations and colours if:    
    * Your resolution is not 1600 x 900.
    * Your rendering API is not Direct3D -dx9 (e.g. OpenGl, Vulkan).

## Set-up
- You need to have [**AutoHotkey**](https://autohotkey.com/download/) installed to execute **.ahk** files.
- To run - open any **.ahk** file. An appropriate icon should appear in the system tray (area near clocks). 
## Default hotkeys:

#### Pause / unpause the script.
You can freeze the script, if something went horribly wrong :)
> Numpad0

#### Switch between custom scripts. 
Assign your most frequently used scripts in **utility.ahk**.
> Numpad2 - Numpad9 

#### Reset to default script.
The default script has no special hotkeys.
> Numpad1 

#### Right click spammer.
You can steal the rune or block creeps with this. Can be affected by your ping and network quality.
> LWin 

#### Extra hotkey.
Capslock can be used as an extra hotkey. Remmaped to `/`.
> CapsLock

#### Resend a courier to the next available teammate.
`requires proper coordinates and pixel colours`

> ALT + ~ 
1. Click the courier control `>` icon in the right bottom corner.
2. If there are any teamates on the list, click on the first one.


<h2>Earth.ahk  <img style="-webkit-user-select: none;" src="https://gamepedia.cursecdn.com/dota2_gamepedia/1/1f/Earth_Spirit_minimap_icon.png?version=9e06c5eb04270e8e24af9dd157f87b53"> 
</h2>
  
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


<h2>Sf.ahk  <img style="-webkit-user-select: none;" src="https://gamepedia.cursecdn.com/dota2_gamepedia/0/00/Shadow_Fiend_minimap_icon.png?version=3a4cbd25ad1fa5d0051e4ecb2991acff"> 
</h2>

#### Directed raze 
> alt + q 

> alt + w 

> alt + e

- uses directional move to direct the hero, follows with a raze and an attack hotkey


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
 
#### X-mark into torrent combo:
> alt + d 
- Use torrent and wait exectly 1600 ms to return an enemy with x-mark. 
- The **latest time** to return is **2000ms** out of 4000ms, after this point the return cast animation will be interrupted and the torrent will be 0-400 ms (cast animation) late.

<h2>Arc.ahk  <img style="-webkit-user-select: none;" src="https://gamepedia.cursecdn.com/dota2_gamepedia/e/e9/Arc_Warden_minimap_icon.png?version=5ba1cba6ca6321a6232dfdce6eb90a4f">
</h2>

`requires proper coordinates`

`turn on autoselect summoned units`

#### The issue: 
Arc's and Tempest Double's necro book can not be pernamently assigned to different hot-keys. Thus, it is not trivial to send both necro books on different camps relatively quickly.

#### Quick bind:
If you have a hero and 2 summons selected, deselects the first unit (e.g. Arc or Tempest Double) and binds the rest to a specific hotkey.

> alt + z 
- bind book 1 to `A`
> alt + x 
- bind book 2 to `S`
