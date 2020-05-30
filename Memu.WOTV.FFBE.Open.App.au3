#cs ----------------------------------------------------------------------------

 Script Version: 0.1.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running MEMU Play (Android 7)
 Display Settings:
	Resolution - Tablet(1280*720, 192dpi), Frame rate(60 FPS), Anti-Flickering(ON)
	Window size - Width(836), Height(480)
 Script Function:
	AutoIt script to open WOTV FFBE in MEMU PLAY android emulator.

#ce ----------------------------------------------------------------------------

; Sets the relative coords used in the mouse/pixel functions to the active window
Opt("MouseCoordMode", 0)
Opt("PixelCoordMode", 0)

; Selects the MEMU Play emulator window, in this case mine is called (MEMU01)
WinActivate("(MEMU01)")
sleep(250)

; Starts WOTV Application using the Google Search bar on the Home Screen to search for WOTV app
MouseClick("left", 275, 78)
sleep(250)
Send("WOTV{Enter}")
sleep(500)
Do
	Sleep(250)
	Local $WOTVGreenOpenButton = PixelGetColor(656, 135)
Until $WOTVGreenOpenButton == 0x01875F
MouseClick("left", 680, 143)

; Clicks the Touch To Start area to enter WOTV
Do
	Sleep(250)
	$TouchToStart = PixelSearch(385, 400, 420, 425, 0x929DE7, 10)
Until Not @error
MouseClick("left", 400, 420)

Func MyExit()
    Exit
EndFunc   ;==>MyExit
#EndRegion