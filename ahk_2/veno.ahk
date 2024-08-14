#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/veno.png", 1)

Space:: 
{
    Send("{Ctrl Down}{Space}{Ctrl Up}")
    return
}