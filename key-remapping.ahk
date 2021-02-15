#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!`::
Send, {Backspace}
return

!Esc::
Send, {Enter}

; convert to lower ;
^#l::                                                                
 Convert_Lower()
RETURN

; convert to upper case
^#u::                                                                
 Convert_Upper()
RETURN

; convert to capitalized case
^#k::                                                                
 Convert_Cap()
RETURN


::qc::Quick call?
::mvn::mvn clean install -DskipTests

; Windows Key + P (Not working)
<#p::switchToPostman()

; Windows Key + V (Not working)
<#v::switchToVSCode()

; Windows Key + C
<#c::switchToChrome()

; Windows Key + I
<#i::switchToIntellij()

; Windows Key + S
<#s::switchToSlack()

; Windows Key + T 
<#t::switchToTiddlyWiki()

; Windows Key + Z
<#z::switchToZoom()

; Windows Key + F
<#f::switchToFirefox()


; Windows Key + X 
<#X::switchToWindowsTerminal()

switchToIntellij()
{
IfWinNotExist, ahk_exe idea64.exe
    Run, idea64.exe

if WinActive("ahk_exe idea64.exe")
    Sendinput ^{tab}
else
	WinActivate ahk_class SunAwtFrame
}

switchToTiddlyWiki()
{
IfWinNotExist, ahk_exe nw.exe
    Run, nw.exe

WinActivate ahk_exe nw.exe
}
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

switchToZoom()
{
IfWinNotExist, ahk_exe Zoom.exe
    Run, Zoom.exe

WinActivate ahk_class ZPContentViewWndClass
}

switchToFirefox()
{
IfWinNotExist, ahk_class MozillaWindowClass
	Run, firefox.exe
if WinActive("ahk_exe firefox.exe")
	{
	WinGetClass, class, A
	if (class = "Mozillawindowclass1")
		msgbox, this is a notification
	}
if WinActive("ahk_exe firefox.exe")
	Send ^{tab}
else
	{
	;WinRestore ahk_exe firefox.exe
	WinActivatebottom ahk_exe firefox.exe
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_class MozillaWindowClass
	DllCall("SetForegroundWindow", UInt, hWnd) 
	}
}

switchToVSCode()
{
IfWinNotExist, ahk_exe Code.exe
    Run, Code.exe

WinActivate ahk_class Chrome_WidgetWin_1       
}

switchToWindowsTerminal()
{
IfWinNotExist, ahk_exe WindowsTerminal.exe
    Run, WindowsTerminal.exe

WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
}

switchToPostman()
{
IfWinNotExist, ahk_exe Postman.exe
    Run, Postman.exe

WinActivate ahk_class Chrome_WidgetWin_1
}

Convert_Lower()
{
 Clip_Save:= ClipboardAll                                                 ; save original contents of clipboard
 Clipboard:= ""                                                           ; empty clipboard
 Send ^c{delete}                                                          ; copy highlighted text to clipboard
 StringLower Clipboard, Clipboard                                         ; convert clipboard to desired case
 Send %Clipboard%                                                         ; send desired text
 Len:= Strlen(Clipboard)
 Send +{left %Len%}                                                       ; highlight text
 Clipboard:= Clip_Save                                                    ; restore clipboard
}


Convert_Upper()
{
 Clip_Save:= ClipboardAll                                                 ; save original contents of clipboard
 Clipboard:= ""                                                           ; empty clipboard
 Send ^c{delete}                                                          ; copy highlighted text to clipboard
 StringLower Clipboard, Clipboard                                         ; convert clipboard to desired case
 Send %Clipboard%                                                         ; send desired text
 Len:= Strlen(Clipboard)
 Send +{left %Len%}                                                       ; highlight text
 Clipboard:= Clip_Save                                                    ; restore clipboard
}

Convert_Cap()
{
 Clip_Save:= ClipboardAll                                                 ; save original contents of clipboard
 Clipboard:= ""                                                           ; empty clipboard
 Send ^c{delete}                                                          ; copy highlighted text to clipboard
 StringLower Clipboard, Clipboard                                         ; convert clipboard to desired case
 Send %Clipboard%                                                         ; send desired text
 Len:= Strlen(Clipboard)
 Send +{left %Len%}                                                       ; highlight text
 Clipboard:= Clip_Save                                                    ; restore clipboard
}
