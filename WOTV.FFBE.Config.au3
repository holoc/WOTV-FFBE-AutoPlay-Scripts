#cs ----------------------------------------------------------------------------

 Script Version: 0.2.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running MEMU Play (Android 7)
 Display Settings:
	Resolution - Tablet(1280*720, 192dpi), Frame rate(60 FPS), Anti-Flickering(ON)
	Window size - Width(836), Height(480)
 Script Function:
	Contains the configuration options fitted for your situation.

#ce ----------------------------------------------------------------------------

; Require this for Windows 10 for script to work, not sure if it applies to other OSes.
#RequireAdmin

; Sets the relative coords used in the mouse/pixel functions to the active window
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)

Global $roomNumberCode = ""

;Global $hostWindowName = "(MEmu - Phantom Brig)" ;3
Global $hostWindowName = "(MEmu - Adelard)" ;5
Global $windowHandle = WinGetHandle($hostwindowName)

Global $hostMemuVMSInstance = 5 ;Use "./memuc listvms -s" to determine which # instance your targetted
Global $slave01WindowName = ""
Global $slave02WindowName = ""
Global $slave03WindowName = ""

Global $memuUseSync = True ;to code at a later point

Global $playerName = ""
