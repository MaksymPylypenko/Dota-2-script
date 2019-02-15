I_Icon = icons/arc.png

#Include %A_ScriptDir%/utility.ahk
#SingleInstance force

; The issue:
; Arc's and Tempest Double's necro book can not be pernamently assigned to different hot-keys. Thus, it is not trivial to send both necro books on different camps relatively quickly.

; Quick bind:
; If you have a hero and 2 summons selected, deselects the first unit (e.g. Arc or Tempest Double) and binds the rest to a specific hotkey.

; 1
LAlt & z::
  mousegetpos,x,y		
  Send {LShift Down}
  click, 514 803 		; X, Y coordinates of a hero (always 1st)
  Sleep, 100
  Send {LShift Up}
  
  Sleep, 100
  
  Send { LCtrl Down}
  send a				; put YOUR BIND HOTKEY for book 1   
  Sleep, 100
  Send { LCtrl Up}
  mousemove x,y			
return

; 2
LAlt & x::
  mousegetpos,x,y		
  Send {LShift Down}
  click, 533 803		; X, Y coordinates of a Tempest Double (always 1st)... This might be different from hero 
  Sleep, 100
  Send {LShift Up}
  
  Sleep, 100
  
  Send { LCtrl Down}
  send s 				; put YOUR BIND HOTKEY for book 2   
  Sleep, 100
  Send { LCtrl Up}
  mousemove x,y			
return


