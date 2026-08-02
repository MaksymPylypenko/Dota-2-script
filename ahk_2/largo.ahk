#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/largo.png", 1)

; Global state for ult mode ("q", "w", "e", "qe", "qw", "we", or "" for off)
ultMode := ""

; Helper function to send the current mode keys
SendUltMode(){
    global ultMode
    if (ultMode = "")
        return
    if (ultMode = "qe") {
        Send "q"
        Send "e"
    } else if (ultMode = "qw") {
        Send "q"
        Send "w"
    } else if (ultMode = "we") {
        Send "w"
        Send "e"
    } else {
        Send ultMode
    }
}

; Helper function to detect combo and return mode
; a -> q, s -> w, d -> e
DetectMode(key){
    ; Small delay to allow combo key to be pressed
    Sleep 30
    
    if (key = "a") {
        if (GetKeyState("s", "P"))
            return "qw"
        else if (GetKeyState("d", "P"))
            return "qe"
        else
            return "q"
    } else if (key = "s") {
        if (GetKeyState("a", "P"))
            return "qw"
        else if (GetKeyState("d", "P"))
            return "we"
        else
            return "w"
    } else if (key = "d") {
        if (GetKeyState("a", "P"))
            return "qe"
        else if (GetKeyState("s", "P"))
            return "we"
        else
            return "e"
    }
    return key
}

; Helper function to set mode and run loop
SetUltMode(key){
    global ultMode
    newMode := DetectMode(key)
    
    ; If loop not running, start it and send immediately
    if (ultMode = "") {
        ultMode := newMode
        SendUltMode()
        SetTimer(SendUltMode, 1000)  ; Non-blocking timer
    } else {
        ; Just switch mode, no immediate send
        ultMode := newMode
    }
}

; Abort ult mode with F (~ means pass through to OS)
~f::{
    global ultMode := ""
    SetTimer(SendUltMode, 0)  ; Stop the timer
}

; Abort ult mode with R (~ means pass through to OS)
~r::{
    global ultMode := ""
    SetTimer(SendUltMode, 0)  ; Stop the timer
}

; Alt + A -> loops Q
LAlt & a::{
    SetUltMode("a")
}

; Alt + S -> loops W
LAlt & s::{
    SetUltMode("s")
}

; Alt + D -> loops E
LAlt & d::{
    SetUltMode("d")
}
