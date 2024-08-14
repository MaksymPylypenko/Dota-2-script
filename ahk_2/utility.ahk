#Requires AutoHotkey v2.0 
#SingleInstance force
SetWorkingDir A_ScriptDir
SetNumlockState "AlwaysOn"
SetCapsLockState "AlwaysOff"
TraySetIcon("../icons/idle.png", 1)

config := Object()

; @TODO: set your values here!
config.directional_move := "h"
config.attach_non_hero := "n"
config.attack := "g"
config.stop := "space"
config.patrol_move := "b"

Numpad1::{
  Run "utility.ahk" 
  ExitApp
}

Numpad2::{
  Run "invoker.ahk" 
  ExitApp
}

Numpad3::{
  Run "sf.ahk" 
  ExitApp
}

Numpad4::{
  Run "earth.ahk" 
  ExitApp
}

Numpad5::{
  Run "techies.ahk" 
  ExitApp
}

Numpad6::{
  Run "veno.ahk" 
  ExitApp
}

Numpad7::{
  Run "ember.ahk" 
  ExitApp
}

; Quick directional move
direct(var){
  Send "{" var " down}"
  Sleep 1
  Send "{Click R}"
  Sleep 1
  Send "{" var " up}"
  Sleep 1
}
Right::direct(config.directional_move)
; !Right::direct(config.attach_non_hero)


; Save time
incrementAndSaveClipboard(delta){
  Send "^a"
  Sleep 50
  Send "^x"
  Sleep 50

  ClipWait 0.5  ; Wait for the clipboard to contain data
  clipboard := A_Clipboard
  _variable := SubStr(clipboard, -4)
  if (!_variable){
    return
  }
  ; Check if the substrings for minutes and seconds are numeric
  _minutes := SubStr(_variable, -4, 2)
  _seconds := SubStr(_variable, -2, 2)
  if (!IsNumber(_minutes) or !IsNumber(_seconds)){
    ;MsgBox "Clipboard does not contain a valid time format."
    return
  }
  _minutes += delta  ; Increment minutes by delta
  newMinutes := SubStr("00" . _minutes, -2)
  newTime := newMinutes . _seconds
  
  _strLen := StrLen(clipboard)
  if (_strLen <= 4){
    A_Clipboard := newTime
  }
  else {
    restLen := _strLen - 4
    restStr := SubStr(clipboard, 1, restLen)
    result := restStr . newTime
    A_Clipboard := result
  }
}

; Function to check if a string is numeric
IsNumber(value){
  return RegExMatch(value, "^\d+$")  ; Returns 1 if value is numeric, otherwise 0
}

LControl & End::incrementAndSaveClipboard(3) ; Aegis
LControl & PgDn::incrementAndSaveClipboard(5) ; Rosh expiry
LControl & PgUp::incrementAndSaveClipboard(8) ; Buy back cooldown


; Use Capslock as an extra hotkey without it interfering with your chat
CapsLock:: .


; Same for windows key
$LWin::M


; Right click spamm [alt + g] 
!g:: 
{  
  while GetKeyState("g","P"){
    SendInput "{RButton}"
    Sleep 20
  }
  return
}
