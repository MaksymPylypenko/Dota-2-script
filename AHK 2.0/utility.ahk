#Requires AutoHotkey v2.0 
#SingleInstance force
SetWorkingDir A_ScriptDir
SetNumlockState "AlwaysOn"
SetCapsLockState "AlwaysOff"
TraySetIcon("../icons/idle.png", 1)

config := Object()
config.directional_move := "h"

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

  variable := SubStr(clipboard, -3)	
  _minutes := SubStr(variable,-4,2) + 5
  newSeconds := SubStr(variable,-1,2)
  newMinutes := SubStr("00" . _minutes,-1)
  newTime := %newMinutes%%newSeconds%		
  ;MsgBox % "newTime="newTime

  strLen:=StrLen(clipboard)
  if(strLen<=4){
    Clipboard := newTime
  }
  else{
    restLen :=strLen-4
    restStr := SubStr(clipboard, 1, restLen)
    result := %restStr%%newTime%
    Clipboard := result
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


