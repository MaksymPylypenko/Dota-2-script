# Dota-2-script

An external dota 2 script for dota 2 running on Windows

## Getting Started

The script is written in [**AutoHotkey**](https://autohotkey.com/download/) scripting language. You will need this to be installed to run and edit the script. 

## Running

1. Make sure your keyboard layout is set to ENG.
2. To run the script simply open [rightclick.ahk]. An appropriate icon will appear.
3. Press num_0 to pause the script. An appropriate sound will be played. Press num_0 again to unpause.
4. You should now be able to use hotkeys.

### rightclick.ahk
* `num_0` - pause/unpause + sound notification
* `b` - hold b then press left click (quick patrul)
* `v` - hold v then press right click (quick directional move)
* `alt + right click` - spam right click (pickup runes)

The next hotkeys should probably be in a different file, since I only use them for tinker.
* `alt + t` - spam t (rearm, blink out)
* `alt + 5` - mana abuse (efficient mana regeneration on fontain)

### Known issues 
* Mana abuse works only on 1600x900 resolution.
* T spammer sometimes fails to stop. (fixed by locking numlock on).
* Fails to see an active SoulRing because of the hover effect when the item is rearmed. (fixed by adding 200ms for double check)

### How mana abuse works ?
The script checks your items (1,2,6) and mana status (above 75% or not) by checking the color of pixels in appropriate points on your screen. 
* Available positions for SoulRing are 1st slot or 7th slot (1st in backpack).
* Available positions for Bottle are 2nd, 6th slot or 8th slot (2st in backpack). 
* Static positions for Blink and Travels are 4th and 5th slots (will never be dropped). 

When sufficient information is collected it decides what to do depending on the situation. For example:
1. If enough mana, THEN use rearm
2. Not enough mana, Soul Ring (1st slot) is in cooldown, try to use bottle then try to use rearm. 
3. Not enough mana, Soul Ring (1st slot) is ready, 2nd or 6th is not a Bottle, THEN drop 2,3,6, use SoulRing, move bottle from backpack to 2nd slot and use, move bottle back to backpack, pickup dropped items.

## Under development 
Additional scripts... 

### timer.ahk
* `p` - glyph text notification + sound notification in 4:50 minutes
* `[` - roshan text notification + sound notification in 4:50 minutes
* `]` - reload

### inv.ahk
* `alt + q or w or e` - sends q/w/e 3 times with a random delay between 50 and 150 milliseconds 
