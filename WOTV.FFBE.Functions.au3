#cs -----------------------------------------------------------------------------------

 Script Version: 0.1.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running NoxPlayer (Android 7.1.2)
 Perofrmance settings: High (4 Core CPU, 4096 MB Memory)
 Graphics rendering mode: Speed (DirectX)
 Resolution setting:
	Resolution - Tablet(960x540)
	Window size - Width 960, Height 540, DPI 160
Game Settings:
	Frame settings: 30 FPS
	Mouse accelration: Turn off mouse acceleration in Windows
 Script Function:
	Contains the functions required for this AutoIT script to work.

#ce -----------------------------------------------------------------------------------

Func CleanCacheWOTV($emuInstance = "NoxPlayer")
	; Selects the Android emulator window, in this case mine is called "NoxPlayer"
	WinActivate($emuInstance)
	WinWaitActive($emuInstance)

	; TEMP FIX for WOTV startup crashes: Use a recorded macro for CLEAR CACHE of WOTV FFBE app
	Sleep(250)
	Send("^4")
	WinWaitActive("nox")
	Sleep(450)
	; Click on the Macro Play button for clearing WOTV app cache.
	MouseClick("left", 422, 138)
	Sleep(450)
	WinClose("nox")

EndFunc

Func StartWOTV($emuInstance = "NoxPlayer")
	; Selects the Android emulator window
	WinActivate($emuInstance)
	Sleep(250)

	; Starts WOTV Application using the Google Search bar on the Home Screen to search for WOTV app
	;MouseClick("left", 485, 558)
	;Sleep(250)
	;Send("WOTV{Enter}")
	;Sleep(500)
	;MouseClick("left", 57, 166)

	; Starts WOTV Application using shortcut icon on Smart Search Launcher
	; MouseClick("left", 545, 406)

	; Starts WOTV Application using shortcut icon on Nox Launcher
	MouseClick("left", 678, 190)

	; Clicks the Touch To Start area to enter WOTV
	MouseMove(470, 490, 1)
	PixelCheckColorInArea(470, 490, 510, 500, 0xC7CAE8, 10, 500, 500)

	; Skip over intro video
	Sleep(2000)
	MouseClick("left", 500, 500)
	Sleep(2500)
	PixelCheckColorInArea(470, 490, 510, 500, 0xC7CAE8, 10, 500, 500)
EndFunc

Func PixelCheckColor($xCoordToCheck = 0, $yCoordToCheck = 0, $decPixelColorToSearch = 0x000000, $xCoordToMouseClick = $xCoordToCheck, _
	$yCoordToMouseClick = $yCoordToCheck, $delayTimeInMSec = 250)
	Do
		Sleep($delayTimeInMSec)
		Local $buttonColorValue = PixelGetColor($xCoordToCheck, $yCoordToCheck)
	Until $buttonColorValue == $decPixelColorToSearch
	Do
		MouseClick("left", $xCoordToMouseClick, $yCoordToMouseClick)
		Sleep($delayTimeInMSec)
		$buttonColorValue = PixelGetColor($xCoordToCheck, $yCoordToCheck)
	Until $buttonColorValue <> $decPixelColorToSearch
EndFunc

Func PixelCheckColorBool($xCoordToCheck = 0, $yCoordToCheck = 0, $decPixelColorToSearch = 0x000000)
	Sleep(250)
	Local $buttonColorValue = PixelGetColor($xCoordToCheck, $yCoordToCheck)
	If $buttonColorValue == $decPixelColorToSearch Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func PixelCheckColorInArea($xLeftCoordToCheck = 0, $yTopCoordToCheck = 0, $xRightCoordToCheck = 0, $yBottomCoordToCheck = 0, $decPixelColorToSearch = 0x000000, $shadeVariation = 0, _
	$xCoordToMouseClick = ($xRightCoordToCheck + $xLeftCoordToCheck) / 2, $yCoordToMouseClick = ($yTopCoordToCheck + $yBottomCoordToCheck) / 2, $delayTimeInMSec = 250)
	Do
		Sleep($delayTimeInMSec)
		Local $TouchToStart = PixelSearch($xLeftCoordToCheck, $yTopCoordToCheck, $xRightCoordToCheck, $yBottomCoordToCheck, $decPixelColorToSearch, $shadeVariation)
	Until Not @error
	MouseClick("left", $xCoordToMouseClick, $yCoordToMouseClick)
EndFunc

Func GetRoomNumber($xCoordToCheck = 0, $yCoordToCheck = 0, $decPixelColorToSearch = 0x000000, $delayTimeInMSec = 250, _
	$xLeftCoordToScanNumber = 0, $yTopCoordToScanNumber = 0, $xRightCoordToScanNumber = 0, $yBottomCoordToScanNumber = 0, $mouseClickDragSpeed = 1)
	Do
		Sleep($delayTimeInMSec)
		Local $buttonColorValue = PixelGetColor($xCoordToCheck, $yCoordToCheck)
	Until $buttonColorValue == $decPixelColorToSearch
	Sleep($delayTimeInMSec)

	; Sends hotkey Ctrl+D (need to configure this in preferences) to activate Capture2Text [https://sourceforge.net/projects/capture2text/]
	; Mouse highlights rectangular box over area with room number code to create screenshot in Capture2Text
	;WinActivate($hostWindowName)
	Opt("MouseCoordMode", 0)
	Sleep($delayTimeInMSec)
	MouseMove( $xLeftCoordToScanNumber, $yTopCoordToScanNumber)
	Send("#{q}")
	Sleep($delayTimeInMSec)
	MouseMove( $xRightCoordToScanNumber, $yBottomCoordToScanNumber)
	MouseClick("left")
	WinActivate("Capture2Text")
	Send("!{F4}")
	Sleep($delayTimeInMSec)
	Local $roomNumberCode = ClipGet()
	Return $roomNumberCode
EndFunc

Func MyExit()
    Exit
EndFunc   ;==>MyExit