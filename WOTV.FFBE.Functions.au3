#cs -----------------------------------------------------------------------------------

 Script Version: 0.2.0
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

#include <Process.au3> ; needed for _RunDOS()
#include <WinAPI.au3>
#include <WOTV.FFBE.Config.au3>

Func _Terminate()
    Exit
EndFunc   ;==>_Terminate

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
	$yCoordToMouseClick = $yCoordToCheck, $delayTimeInMSec = 250, _
	$x2CoordToCheck = 0, $y2CoordToCheck = 0, $dec2PixelColorToSearch = 0x000000, $x2CoordToMouseClick = 0, $y2CoordToMouseClick = 0)
	; Second parameters are for pop-up screens

	; Check specified pixels until there is a color match
	Do
		Sleep($delayTimeInMSec)
		Local $pixelColorCurrentValue = StringTrimRight(PixelGetColor($xCoordToCheck, $yCoordToCheck), 3)
		Local $pixelColorCurrentValue2 = StringTrimRight(PixelGetColor($x2CoordToCheck, $y2CoordToCheck), 3) ; there's probably an easier way to evaluate multiple conditions...but this will have to do
	Until $pixelColorCurrentValue == StringTrimRight($decPixelColorToSearch,3) Or $pixelColorCurrentValue2 == StringTrimRight($dec2PixelColorToSearch,3)

	; Once a color match is found, left-mouse click at specified xy coord location
	Do
		If $pixelColorCurrentValue2 == StringTrimRight($dec2PixelColorToSearch, 3) Then
			Sleep($delayTimeInMSec*2)
			MouseClick("left", $x2CoordToMouseClick, $y2CoordToMouseClick)
			Sleep($delayTimeInMSec)
			$pixelColorCurrentValue2 = StringTrimRight(PixelGetColor($x2CoordToCheck, $y2CoordToCheck), 3)
			; Followed by first set of parameters
			Sleep($delayTimeInMSec*2)
			MouseClick("left", $xCoordToMouseClick, $yCoordToMouseClick)
			Sleep($delayTimeInMSec)
			$pixelColorCurrentValue = StringTrimRight(PixelGetColor($xCoordToCheck, $yCoordToCheck), 3)
		ElseIf $pixelColorCurrentValue == StringTrimRight($decPixelColorToSearch, 3) Then
			Sleep($delayTimeInMSec*2)
			MouseClick("left", $xCoordToMouseClick, $yCoordToMouseClick)
			Sleep($delayTimeInMSec)
			$pixelColorCurrentValue = StringTrimRight(PixelGetColor($xCoordToCheck, $yCoordToCheck), 3)
		EndIf
	Until $pixelColorCurrentValue <> StringTrimRight($decPixelColorToSearch, 3) Or $pixelColorCurrentValue2 <> StringTrimRight($dec2PixelColorToSearch, 3)
EndFunc

Func PixelCheckColorBool_PixelGetColor($xCoordToCheck = 0, $yCoordToCheck = 0, $decPixelColorToSearch = 0x000000)
	; Old method based on PixelGetColor(), which required the window to be active in order for the script to work.
	Sleep(250)
	Local $pixelColorCurrentValue = PixelGetColor($xCoordToCheck, $yCoordToCheck)
	If $pixelColorCurrentValue == $decPixelColorToSearch Then
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

Func MemoryReadPixel($x, $y, $handle)
	; Function Reference: https://www.autoitscript.com/forum/topic/136347-solved-pixelgetcolor-in-a-background-window/?do=findComment&comment=953351
	; MemoryReadPixel() Function replaces PixelGetColor() as does not require the target window to be active in order to gather pixel information.
	; This function is also much faster than PixelGetColor() when using the test case in above reference.

	Local $hDC
	Local $iColor
	Local $sColor

	$hDC = _WinAPI_GetWindowDC($handle)
	$iColor = DllCall("gdi32.dll", "int", "GetPixel", "int", $hDC, "int", $x, "int", $y)
	$sColor = Hex($iColor[0], 6)
	_WinAPI_ReleaseDC($handle, $hDC)

	Return Hex("0x" & StringRight($sColor, 2) & StringMid($sColor, 3, 2) & StringLeft($sColor, 2))
EndFunc

Func PixelCheckColorBool($xCoordToCheck = 0, $yCoordToCheck = 0, $decPixelColorToSearch = 0x000000)
	Sleep(250)
	Local $pixelColorCurrentValue = MemoryReadPixel($xCoordToCheck, $yCoordToCheck, $windowHandle)
	If $pixelColorCurrentValue == hex($decPixelColorToSearch) Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func SendInputTap($xCoord, $yCoord, $MemuVMSInstance = $hostMemuVMSInstance)
	; Use this function in place of AutoIt's MouseClick() function as it directly sends Input Tap commands to the Memu Emulator Instance, which
	; means that the target window does not have to be actively selected for sent touch commands to work.
	Local $sDOSEXEFilePath = '"C:\Program Files\Microvirt\MEmu\memuc.exe" -i ' & $MemuVMSInstance & ' adb shell input tap ' & $xCoord & ' ' & $yCoord
	_RunDOS($sDOSEXEFilePath)
EndFunc