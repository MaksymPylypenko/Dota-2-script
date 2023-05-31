#Requires AutoHotkey v2.0 
#SingleInstance force

#Include %A_ScriptDir%/utility.ahk
TraySetIcon("../icons/invoker.png", 1)

LAlt & q::Send "qqq"
LAlt & w::Send "www"
LAlt & e::Send "eee"

; Helps avoid missclicks
LAlt & r::send "r"


