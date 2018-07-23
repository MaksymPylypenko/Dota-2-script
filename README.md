# Dota-2-script
Open source Autohotkey script.

## Set-up
* You can use **utility.ahk** as a starting point to create your own autohotkey script.
* It has a config section that should contain your in-game hotkeys ( items, abilities, directional move )
* Some scripts compare pixels on the screen. Unless your resolution is 1600 x 900, you might need to use Window Spy to find your own locations and colours.

## Run
1. Install [**AutoHotkey**](https://autohotkey.com/download/).
2. Run `utility.ahk`.

* `LWin` - pause / unpause the script.
* `alt + RightClick (hold)` - right click spammer.
* `CapsLock` - remmaped to `/`. Can be used as an extra hotkey.
* `alt + ~` - resend courier to the next available teamate. (requires proper coordinates). 

## utility.ahk
It contains functions and hotkeys that you might use for any hero.

### repeater( key, host )
Repeats the same key (50 ms delay). Requires a low ping.

**Examples of using:**
* steal rune. 
* blink after rearm / aegis.

### direct( )
A "quick" directional move. Instead of holding a key before cliking, just click once. Mostly used in directItem( i ) and directAbility( i ).

**Examples of using:**
* raze on shadow fiend. 
* jump on slark / mirana.
* rp on magnus. 
* forcestuff.

### backpack( i ) 
Uses drag(x1,y1,x2,y2) to move an item with a cursor (requires proper coordinates). Allows to quickly use an item from a backpack (near fontain / shop). Alternative version backpackL( i ) restores mouse position at the end. 

There are also  item( i ) and ability ( i ) for convinience. They simply use an item or ability at index i. Allows to change hotkeys in a config section.

**Examples of using:**
* bottle on any hero (as 7th slot) near fontain.
* bkb on spectre (as 7th slot) near fontain. 
* tranquil boots swap when jungling.


## Examples of custom scripts
* To import utility functions, add `#Include %A_ScriptDir%/utility.ahk` at the top of your custom script.

### earth.ahk 
* `alt + q` - blink-safe boulder smash (prevents placing a stone in a previous location).
* `alt + w` - does boulder (q) and rolling (w) using 1 stone only.

<a href='https://photos.google.com/share/AF1QipM8nC1isaOdMMlGHSjo88Px1PB5M1THSoTuINmtbAm3NNHSegNHH_GVnNDj9CCp8A?key=dlFGSDhidFUxUnVsQjRRVFZNQV96ZU1Ka1BLWFJR'/><img src='https://lh3.googleusercontent.com/F8ax7MZDXmUAtYzHfyWWTO7B47j4_yoDumuIlCqyAfF6AQVibhe5z9wd5B4ybFTawIXXsVSBpg3vadq6KnIlhSqODRVoUVX4GfPknTgjfI02C71VXu7CNhaf4r6XHJPJyyCWvrAdYN7YuxqQ3c2GNBYNwtEm4-yeRKoJqIVBKROE-YN2_tYdTsNuiKIF8lYXKehtQ0vyGcUNbgwD0q3n8l1O5eZsD7c5uvnIXRWSeVzYxEJxp3HXQJKrtzWyDssTIIRjXML-1_M5ZQZvidsLlp188Q5OBAZyTVWf-KCCALCGBoxKKCTa7tElGRPyYgirdnxwT1eAQT9PfV4zC7208oLKQcwqxUeyGm4YvpiZ2b_ZImb7_ibMgTzJdo_jZhpI8Mz2Bu73R7bHtVPwi_2WAiemuTQ404Fd_btl8ciaC06TcBDUWPnK08Rd0drAeTzJij3HKzR41U_tKkOs5t2bl3YGV5vgJQuAIswYtTQU96m3i7zY2QeK38IxWK8nHzuAiJ6dWs0uQ10yoq6qlpgZZQcTwMFMq2-lgs_p-XBpULplD9S1xKcYKiT4pq0qdiRxWxEbe0GNVkphXWuac8XCjrV9jHaXTd_8VaNq9QCm0pBUvD0J6St-rB0owzspaPqUrVQl56kkrUa2rRfANT6oVGn4Mg2SWrVe_A=w1364-h767-no' /></a>

## sf.ahk 
* `alt + q/w/e ` - rotates the hero and uses raze (usefull when standing near edges).

<a href='https://photos.google.com/share/AF1QipOaeWFNBmnsrGPRVVeBfvAHFLoG3BEPnL8deRxEz6tjUJ2gMzO_HlnzdWzvh_5gag?key=Rk4wUEpIcTQ5OFZmSGtXY2xibURGemRnNXhZWmJR'/><img src='https://lh3.googleusercontent.com/D3KiasiCK-EDmF9-cTGhRNxtj-moqzE6sfrHSQAfuFFP4XDNCB1lMLjEI4R-S6usJB_UTceTpaFE9Rc2cF30kd6aXHIrRrFXjlH6ZhPndKKJIOlmH-wtLccBJojQr0fGZQiKKA58Uw6esEMqmiGEV3YRIE91rNJ-59sqLEgbqsWBtB3yJSygAFcxRnfYspVr-K6_bLM-cSeZ6-gORIGJDas_Avgd0ueHz01GmElNP232jmhlNriaC_f7lLcRA9KsRFXnnpMDFLwnTYrh61uT9DDYP3ijXM_betTzZp1A7qWcoE6u_B2lsmeMlxVRGBdzAe6TB8Z85ZjPEwWRyeM1CNqKSEm8fdufOtZNj9Vi2eHYR0lUoq36JJexrZNh5255VUoH14RMbuYowQVPRqK8BuHxVHbEZ3VCgB_vQkW8XMrc-oD-M1rZ4vKghPKD90IKbQ88UvHzPnjSuhTpDKFwrqj0g8hQtMDl-fpLPIQdufybLe2AAKSrhvEXU-smnrVXwBNC3hmFK2BlBnsBD9TNo6xZZn3j6yjghI5m-ZFHqSxURCgS-tOu0ZQ3hRJGNVCkD4BTgF6u60FvRAUE7RKSzjdEk407J1oshlU2qC8z1d3WuzVqzlY_9LQDkiE4N2aEeQ3vN326BiBGk2K48yzuVxYs-050N1_SIw=w1364-h767-no' /></a>


## tinker3.ahk
Requires proper coordinates!

* `alt + d` - drops items (shift queue during rearm). 
  * find bottle and use it.
  * drop everything that gives you mana.
* `alt + f` - pickup items (after rearm).
  * find soul-ring and use it.
  * find bottle and use it.
  * pickup dropped items in the original order (hopefully).

<a href='https://photos.google.com/share/AF1QipOz5fZZx3X_L-59v4_Ay_XWxmEPgYi7-MnCPKLY7fNUbMAR9wW_6eDvn-84VxhMlw?key=WW1nSUY3RWlQNXY3TmV2WmNuWllRYUdMbnVHTHFn'/><img src='https://lh3.googleusercontent.com/iqu5LAz6E4X0IWqjxu9FCVfXE8rjZbaWmS4EXR5wwUZDGrYwI-nqjti52ZDzXdfgaj4_m1vwwHQ__Oynox346BvIKTM0VIumgdIwyzWu2SWs22oUcoDi__ccIwHwRQ7nYXInhzCppmFOFd0BhxZVeX6o46pupkok55WnZCPE_8L7ZxmEHS9zwJrN0BhueTiRwAxhsG4aZguXf1GriljPEyqOf6AetFAuGSoU7g7NaO2u0IhJddkYPTxlRbPRRP6O-iDXJczkiTBVALqrJJ1LfU0FuskWmbaI6a7vorydNFZaLbulGUkM1e9ZXJ3mtUwYAqOGjhgXhgDLSWSSEZ3wRBSRSEde86SZXwmRh_GcQXJ4yZriUujitWxWfbdVyZm_qnqcQCmQghdlFpFcuVuHzWhkpq63L1gV43oGhNHDzSSnUlIanUPkIq36bD-k8hnf_bwmaj3zytHSOhy1ic5DoS6QMOwmEomk4g9MpybxSu5NQWp-dXnkLre-jJ1qP73Nbfe0nsv8onatgq76aLAegwjV1EgOH8-ygMtd6ukM4W7OX6dAFaEX5k19rQF7uJHHALUqeNOxXVEcpzzw5RZSFgvqAPN8-zLeTcT8SWvV3rG1Is5JgGtcl8-UjHBwNNyQkXRdzbVmywEHRnHcmz3a2C38JezNgMxVCw=w1092-h614-no' /></a>
