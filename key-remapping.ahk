#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!`::
Send, {Backspace}
return

!Esc::
Send, {Enter}

::qc::Quick call?
::mvn::mvn clean install -DskipTests

; Windows Key + C
<#c::switchToChrome()

; Windows Key + I
<#i::switchToIntellij()

; Windows Key + S
<#s::switchToSlack()

switchToIntellij()
{
IfWinNotExist, ahk_exe idea64.exe
    Run, idea64.exe

if WinActive("ahk_exe idea64.exe")
    Sendinput ^{tab}
else
	WinActivate ahk_class SunAwtFrame
}

; Not working
switchToSlack()
{
IfWinNotExist, ahk_exe slack.exe
    Run, slack.exe

WinActivate ahk_exe slack.exe
}

switchToChrome()
{
IfWinNotExist, ahk_exe chrome.exe
	Run, chrome.exe

if WinActive("ahk_exe chrome.exe")
	Sendinput ^{tab}
else
	WinActivate ahk_exe chrome.exe
}