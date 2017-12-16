# Dota-2-script
An external dota 2 script for Windows.

## Getting Started
The script is written in [**AutoHotkey**](https://autohotkey.com/download/) scripting language. You will need this to be installed to run and edit the script. 

## Running
1. Make sure your keyboard layout is set to ENG.
2. To run the script simply open **rightclick.ahk**. An appropriate icon will appear.
3. Press windows key to pause the script. An appropriate sound will be played. Press it again to unpause.
4. You should now be able to use hotkeys.

### rightclick.ahk
* `win` - pause/unpause the script + sound notification
* `capslock` - remapped to `/` 
* `b` - hold b then press left click (quick patrul)
* `v` - hold v then press right click (quick directional move)
* `alt + right click` - spam right click (pickup runes)
* `alt + ~` - uses mouse to resend a courier to the next person

The next hotkeys should probably be in a different file, since I only use them for tinker.
* `alt + t` - spams t (rearm, blink out)
* `alt + 5` - uses smart mana abuse (efficient mana regeneration on fontain)

### Known issues 
* Mana abuse and courier resend works only on 1600x900 resolution.
* T spammer sometimes fails to stop. (fixed by disabling and remapping the capslock)
* Fails to see an active soul ring because of the hover effect after rearm. (fixed by adding 200ms for double check)

### How mana abuse works ?
The script checks your items (1,2,6) and mana status (above 75% or not) by checking the color of pixels in appropriate points on your screen. 
* Available positions for soul ring are 1st slot or 7th slot (1st in backpack).
* Available positions for bottle are 2nd, 6th slot or 8th slot (2st in backpack). 
* Available positions for blink and travels are 4th and 5th slots. These items will never be dropped. 

When sufficient information is collected it decides what to do depending on the situation. These are some (not all) rules:

1. IF not enough mana, soulring is in cooldown, THEN try to use bottle, try to use rearm. 
2. IF not enough mana, soulring is ready, THEN try to use bottle, drop 3,5, use soulring, pickup 3,5, use bottle.

<a href='https://photos.google.com/share/AF1QipO0GWQpaQXsnX_UpXqlOrz7vhFJKIE3eubbmNgkc8bWicxp3op1CKgoYAub0sP5pA?key=UGRpV2RQXzR2MTZOelFqMWFzYzhJOVUyQlU2UHd3&source=ctrlq.org'><img src='https://lh3.googleusercontent.com/8hI9I257oc9hCYSjW_Vgho6wgRWcJlx45cYA8bxFpdSjUHWnzSLI4efPeBAuQ_8yyk5a3HNcxb9Hh67uZ4MGEVNwOZx66s9xng8wZqvm2PiLhm1gUSput_tfbJ6seVXG-4zQzHQNhWg' /></a>

1. IF not enough mana, no soulring, no bottle, THEN drop 1,2,3,6, use soulring and bottle from backpack, pickup 1,2,3,6, use rearm

<a href='https://photos.google.com/share/AF1QipPHxg-puAPJUO4gUxWpQhmGcjgR3DW2WUMQ-ydxDNFzCVrodZS2yP8ufrPkKSnCpA?key=c2tEOTlELWNOdTRWeXN3TnlOSXpLSS1Wc3NxQjJR&source=ctrlq.org'><img src='https://lh3.googleusercontent.com/HOzm8Ji4t_5QGFLn5FvFzdZl5bApNQkJY60Or09EoDvoTuctVSLxTHXTvgoKEUkdaR3UqKbNtD6b3DnQBxPKLsMbN0cPwgaSKo9dhTh6LM2o13S-SKXIJjb4-vuyp-wJ9KsEadney8A' /></a>

## Under development 
Additional scripts... 

### timer.ahk
* `p` - glyph text notification + sound notification in 4:50 minutes
* `[` - roshan text notification + sound notification in 4:50 minutes
* `]` - reload

### inv.ahk 
* `alt + q` or `w` or `e` - sends q/w/e 3 times with a random delay between 50 and 150 milliseconds 
* `q + alt` - invoke and use ghost-walk, set remaining orbs to quas
* `shift + q` - invoke and use ghost-walk, set remaining orbs to wex
* `e + alt` - invoke and use alacrity, set remaining orbs to exort
* `e + alt` - invoke and use ice-wall, set remaining orbs to exort
