#cs -----------------------------------------------------------------------------------

 Script Version: 0.1.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running Memu(Android 7.1, 64bit, Microvirt Version 7.2.2)

 Memu System Settings

 Engine
	Performance: Preset settings - Top (CPU:4, RAM:4096MB)
	Render mode: OpenGL
	Root mode: ON
	GPU memory optimization: OFF

 Display
	Resolution: Tablet(1280*720 192dpi)
	Frame rate: 30 FPS
	Anti-Flickering: ON

 Window layout (found under Multiple Instance Manager window -> Layout button)
	Window size - Customize - Width 960, Height 540

 Script Function:
	Basic AutoIt script for FFBE WOTV Multi-Events as the HOST.
	Script can be triggered anywhere in the process of a Multi-Event session.

Current Limitations:
	- Memu Emulator window must be actively selected once the program runs (you can resume by making the Memu window active again)


#ce -----------------------------------------------------------------------------------

#include <WOTV.FFBE.Main.au3>

$timeout = 200

; Select the Android emulator window
WinActivate($hostWindowName)
Sleep($timeout)

; Set the Escape hotkey to terminate the script.
HotKeySet("{ESC}", "_Terminate")

; Create an endless loop, 1 will always be 1 therefore True.
; To end this loop, use the {ESC} key as stated above.
While 1

	; Role: HOST (person paying the NRG Cost)

	; Screen: Multi-Quest Embarkment Room
	; Trigger Condition: When all players in room is 'Ready', 'Embark' button becomes highlighted (use highlighted blue)
	; Action: Click 'Embark' button
	If PixelCheckColorBool(722, 498, 0x4101A4) Then
		Sleep(100)
		MouseClick("left", 773, 515)
		Sleep(300)
	EndIf
	Sleep($timeout)

	; Screen: 'Confirm Embark - Not all players present. Embark anyway?' Popup
	; Trigger Condition: Blue color of 'Embark' button
	; Action: Click 'Embark' button
	If PixelCheckColorBool(546, 422, 0x4A39F5) Then
		Sleep(250)
		MouseClick("left", 545, 400)
	EndIf
	Sleep($timeout)

	; Screen: GAME OVER - Continue
	; Trigger Condition: Red outline of 'Give Up' button
	; Action: Click 'Give Up' button
	If PixelCheckColorBool(315, 496, 0x88282B) Then
		Sleep(2000)
		MouseClick("left", 313, 471)
		Sleep(500)
		; Click 'Yes' button in response to 'Do you really wish to give up?'
		MouseClick("left", 545, 395)
	EndIf
	Sleep($timeout)

	; Screen: First Time Completion Rewards
	; Trigger Condition: Red part of the Star icon
	; Action: Click 'Next' button
	If PixelCheckColorBool(159, 102, 0xC8423E) Then
		Sleep(2000)
		MouseClick("left", 774, 517)
	EndIf
	Sleep($timeout)

	; Screen: Experience/Gil
	; Trigger Condition: Yellow/orange of the Gil coin icon
	; Action: Click 'Next' button
	If PixelCheckColorBool(533, 126, 0xE8C33B) Then
		Sleep(2000)
		MouseClick("left", 773, 515)
	EndIf
	Sleep($timeout)

	; Screen: Friend Requests
	; Trigger Condition: Dark brown background bar of the Player's Name / Rank Level
	; Action: ; Click on 'Cancel' button, then click on 'Return' button
	If PixelCheckColorBool(394, 161, 0x332B29) Then
		Sleep(250)
		; 'Cancel' button
		MouseClick("left", 360, 479)
		Sleep(1000)
		; 'Return' button
		MouseClick("left", 773, 515)
	EndIf
	Sleep($timeout)

	; Screen: Acquired Items
	; Trigger Condition: Red part of quartet
	; Action: Click 'Return' button
	If PixelCheckColorBool(130, 71, 0xC96613) Then
		Sleep(1500)
		MouseClick("left", 773, 515)
	EndIf
	Sleep($timeout)

WEnd
