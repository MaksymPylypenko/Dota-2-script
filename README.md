# Dota-2-script
Open source Autohotkey script.

## Set-up
* You can use **utility.ahk** as a starting point and create your own autohotkey script.
* The config section (in utility.ahk) depends on your in-game hotkeys. The resolution of the screen also matters (deafault is 1600 x900), you might need to use Window Spy to find your own locations on the screen.

## Run
1. Install [**AutoHotkey**](https://autohotkey.com/download/).
2. Run an `.ahk` file.

## utility.ahk

### Functions 
* repeater(key,host) - repeats the same key with a 50 ms delay.
* delay() - creates a random delay between 50-150 ms.
* direct() - rotates the hero using directional move.
* forcestuff(key) - uses selfcast (alt+key).
* drag(x1,y1,x2,y2) - uses cursor to drag item.
* dragr(x1,y1,x2,y2) - uses cursor to drag item (reversed).
* item(i) - uses item (1-6).
* backpack(i) - uses item from a backpack (1-3).

### Default Hot-keys
* `LWin` - pause / unpause the script.
* `CapsLock` - remmaped to `/`. Can be used as an extra hotkey.
* `alt + ~` - resend courier to the next available teamate.
* `alt + RightClick (hold)` - right click spammer.
* `alt + z or x` - uses item from backpack (switch, use, switch back).


## tinker.ahk 
* `alt + 5` - uses smart mana abuse. (efficient mana regeneration on fontain)

The script checks your items (1,2,6) and mana status (above 75% or not) by checking the color of pixels in appropriate points on your screen. 

* Available positions for soul ring are 1st slot or 7th slot (1st in backpack).
* Available positions for bottle are 2nd, 6th slot or 8th slot (2st in backpack). 
* Available positions for blink and travels are 4th and 5th slots. These items will never be dropped. 

When sufficient information is collected it decides what to do depending on the situation. These are some (not all) rules:

1. IF not enough mana, soulring is in cooldown, THEN try to use bottle, try to use rearm. 
2. IF not enough mana, soulring is ready, THEN try to use bottle, drop 3,5, use soulring, pickup 3,5, use bottle.

<a href='https://photos.google.com/share/AF1QipO0GWQpaQXsnX_UpXqlOrz7vhFJKIE3eubbmNgkc8bWicxp3op1CKgoYAub0sP5pA?key=UGRpV2RQXzR2MTZOelFqMWFzYzhJOVUyQlU2UHd3&source=ctrlq.org'><img src='https://lh3.googleusercontent.com/8hI9I257oc9hCYSjW_Vgho6wgRWcJlx45cYA8bxFpdSjUHWnzSLI4efPeBAuQ_8yyk5a3HNcxb9Hh67uZ4MGEVNwOZx66s9xng8wZqvm2PiLhm1gUSput_tfbJ6seVXG-4zQzHQNhWg' /></a>

3. IF not enough mana, no soulring, no bottle, THEN drop 1,2,3,6, use soulring and bottle from backpack, pickup 1,2,3,6, use rearm

<a href='https://photos.google.com/share/AF1QipPHxg-puAPJUO4gUxWpQhmGcjgR3DW2WUMQ-ydxDNFzCVrodZS2yP8ufrPkKSnCpA?key=c2tEOTlELWNOdTRWeXN3TnlOSXpLSS1Wc3NxQjJR&source=ctrlq.org'><img src='https://lh3.googleusercontent.com/HOzm8Ji4t_5QGFLn5FvFzdZl5bApNQkJY60Or09EoDvoTuctVSLxTHXTvgoKEUkdaR3UqKbNtD6b3DnQBxPKLsMbN0cPwgaSKo9dhTh6LM2o13S-SKXIJjb4-vuyp-wJ9KsEadney8A' /></a>
