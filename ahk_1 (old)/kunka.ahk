I_Icon = ../icons/kunka.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

; Timings 
; 4000 ms - max duration of x-mark.  
; 400 ms - torrent, x-mark cast animation. 
; 1600 + 400 = 2000 ms - effective impact delay for torrent. 
; 2000 - 400 = 1600 ms - wait after torrent to return with x-mark.
; 4000 - 1600 = 2400 ms - the longest possible time to use gapless torrent after using x-mark (no return). 

; X-mark into Torrent
; --------------------------------------------
; Use torrent and wait exectly 1600 ms to return an enemy with x-mark.
; The latest time to return is 2000ms out of 4000ms, 
; after this point the return cast animation will be interrupted and the torrent will be 0-400 ms (cast animation) late.

LAlt & d::  
  Send, q		; use torrent 
  sleep, 1600
  Send, e		; return x-mark 
  Send, {%attack%}    
  Reload
return

; Ship into Torrent
; --------------------------------------------
; Very situational. Would not recommend using this.

LAlt & f::  
  Send, r		; use ship 
  Sleep, 2690
  Send, e 		; return x-mark 
  Sleep, 100
  Send, q		; use torrent 
  Reload
return

; Double tap Armlet
; --------------------------------------------
; Change item( ? ) to YOUR ARMLET HOTKEY

LAlt & x::  
  item(2) 		
  Sleep, 60
  item(2)
return