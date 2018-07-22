# Dota-2-script
Open source Autohotkey script.

## Set-up
* You can use **utility.ahk** as a starting point for creating your own autohotkey script.
* The config section (see utility.ahk) depends on your in-game hotkeys. The resolution of the screen also matters (deafault is 1600 x 900), you might need to use Window Spy to find your own locations on the screen.

## Run
1. Install [**AutoHotkey**](https://autohotkey.com/download/).
2. Run an `.ahk` file.

## utility.ahk
* To import, add `#Include %A_ScriptDir%/utility.ahk` at the top of your custom script.

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


## earth.ahk 
* `alt + w` - does boulder (q) and rolling (w) using 1 stone only

<a href='https://photos.google.com/share/AF1QipM8nC1isaOdMMlGHSjo88Px1PB5M1THSoTuINmtbAm3NNHSegNHH_GVnNDj9CCp8A?key=dlFGSDhidFUxUnVsQjRRVFZNQV96ZU1Ka1BLWFJR'/><img src='https://lh3.googleusercontent.com/F8ax7MZDXmUAtYzHfyWWTO7B47j4_yoDumuIlCqyAfF6AQVibhe5z9wd5B4ybFTawIXXsVSBpg3vadq6KnIlhSqODRVoUVX4GfPknTgjfI02C71VXu7CNhaf4r6XHJPJyyCWvrAdYN7YuxqQ3c2GNBYNwtEm4-yeRKoJqIVBKROE-YN2_tYdTsNuiKIF8lYXKehtQ0vyGcUNbgwD0q3n8l1O5eZsD7c5uvnIXRWSeVzYxEJxp3HXQJKrtzWyDssTIIRjXML-1_M5ZQZvidsLlp188Q5OBAZyTVWf-KCCALCGBoxKKCTa7tElGRPyYgirdnxwT1eAQT9PfV4zC7208oLKQcwqxUeyGm4YvpiZ2b_ZImb7_ibMgTzJdo_jZhpI8Mz2Bu73R7bHtVPwi_2WAiemuTQ404Fd_btl8ciaC06TcBDUWPnK08Rd0drAeTzJij3HKzR41U_tKkOs5t2bl3YGV5vgJQuAIswYtTQU96m3i7zY2QeK38IxWK8nHzuAiJ6dWs0uQ10yoq6qlpgZZQcTwMFMq2-lgs_p-XBpULplD9S1xKcYKiT4pq0qdiRxWxEbe0GNVkphXWuac8XCjrV9jHaXTd_8VaNq9QCm0pBUvD0J6St-rB0owzspaPqUrVQl56kkrUa2rRfANT6oVGn4Mg2SWrVe_A=w1364-h767-no' /></a>


## sf.ahk 
* `alt + q/w/e ` - rotates the hero and uses raze (usefull when standing near edges)

<a href='https://photos.google.com/share/AF1QipOaeWFNBmnsrGPRVVeBfvAHFLoG3BEPnL8deRxEz6tjUJ2gMzO_HlnzdWzvh_5gag?key=Rk4wUEpIcTQ5OFZmSGtXY2xibURGemRnNXhZWmJR'/><img src='https://lh3.googleusercontent.com/D3KiasiCK-EDmF9-cTGhRNxtj-moqzE6sfrHSQAfuFFP4XDNCB1lMLjEI4R-S6usJB_UTceTpaFE9Rc2cF30kd6aXHIrRrFXjlH6ZhPndKKJIOlmH-wtLccBJojQr0fGZQiKKA58Uw6esEMqmiGEV3YRIE91rNJ-59sqLEgbqsWBtB3yJSygAFcxRnfYspVr-K6_bLM-cSeZ6-gORIGJDas_Avgd0ueHz01GmElNP232jmhlNriaC_f7lLcRA9KsRFXnnpMDFLwnTYrh61uT9DDYP3ijXM_betTzZp1A7qWcoE6u_B2lsmeMlxVRGBdzAe6TB8Z85ZjPEwWRyeM1CNqKSEm8fdufOtZNj9Vi2eHYR0lUoq36JJexrZNh5255VUoH14RMbuYowQVPRqK8BuHxVHbEZ3VCgB_vQkW8XMrc-oD-M1rZ4vKghPKD90IKbQ88UvHzPnjSuhTpDKFwrqj0g8hQtMDl-fpLPIQdufybLe2AAKSrhvEXU-smnrVXwBNC3hmFK2BlBnsBD9TNo6xZZn3j6yjghI5m-ZFHqSxURCgS-tOu0ZQ3hRJGNVCkD4BTgF6u60FvRAUE7RKSzjdEk407J1oshlU2qC8z1d3WuzVqzlY_9LQDkiE4N2aEeQ3vN326BiBGk2K48yzuVxYs-050N1_SIw=w1364-h767-no' /></a>


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
