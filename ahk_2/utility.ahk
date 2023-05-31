#Requires AutoHotkey v2.0 
#SingleInstance force
SetWorkingDir A_ScriptDir
SetNumlockState "AlwaysOn"
SetCapsLockState "AlwaysOff"
TraySetIcon("../icons/idle.png", 1)

config := Object()

; @TODO: set your values here!
config.directional_move := "h"
config.attack := "g"
config.stop := "space"
config.patrol_move := "b"

^Numpad1::{
  Run "utility.ahk" 
  ExitApp
}

^Numpad2::{
  Run "invoker.ahk" 
  ExitApp
}

^Numpad3::{
  Run "sf.ahk" 
  ExitApp
}

^Numpad4::{
  Run "earth.ahk" 
  ExitApp
}

; Quick directional move
direct(){
  Send "{" config.directional_move " down}{Click R}{" config.directional_move " up}"
}
Home::direct()


; Save time
incrementAndSaveClipboard(delta){
  Send "^a"
  Sleep 50
  Send "^x"
  Sleep 50

  clipboard := A_Clipboard
  _variable := SubStr(clipboard, -4)	
  _minutes := SubStr(_variable,-4,2) + delta
  _seconds := SubStr(_variable,-2,2)
  newMinutes := SubStr("00" . _minutes,-2)
  newTime :=  newMinutes _seconds		
  ;MsgBox "newTime=" newTime

  _strLen:=StrLen(clipboard)
  if(_strLen<=4){
    A_Clipboard := newTime
  }
  else{
    restLen :=_strLen-4
    restStr := SubStr(clipboard, 1, restLen)
    result :=  restStr newTime
    A_Clipboard := result
  }  
}

LControl & Numpad5::incrementAndSaveClipboard(5) ; Rosh expiry
LControl & Numpad8::incrementAndSaveClipboard(8) ; Buy back cooldown


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


; Pause / Unpause Script
Numpad0::suspend


