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

$timeout = 10

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
	; Trigger Condition: When all players in room is 'Ready', 'Embark' button becomes highlighted (use highlighted purple)
	; Action: Click 'Embark' button
	If PixelCheckColorBool(840, 500, 0x4101A4) Then
		SendInputTap(1100, 660)
		Sleep(200)
	EndIf
;	Sleep($timeout)

	; Screen: 'Confirm Embark - Not all players present. Embark anyway?' Popup
	; Trigger Condition: Blue color of 'Embark' button
	; Action: Click 'Embark' button
	If PixelCheckColorBool(542, 421, 0x432EF5) Then
		SendInputTap(760, 520)
	EndIf
;	Sleep($timeout)

	; Screen: 'Restore NRG' Popup
	; Trigger Condition: Dark Brown color of 'Items' title bar button
	; Action: Click 'Items' button
	If PixelCheckColorBool(600, 300, 0x403832) Then
		; Click 'Items - Restore NRG with items.' button
		SendInputTap(600, 400)
		Sleep(100)
		; Check for usable NRG Restore (S)
		If PixelCheckColorBool(660, 266, 0xC8CEF9) Then
			; Click once '+' button for 'NRG Restore (S) - 30 NRG Restoration Amount'
			SendInputTap(910, 320)
		; Check for usable NRG Restore (M)
		ElseIf PixelCheckColorBool(660, 398, 0xCCD4FF) Then
			; Click once '+' button for 'NRG Restore (M) - 60 NRG Restoration Amount'
			SendInputTap(910, 500)
		Else
			SendInputTap(1000, 600)
			SendInputTap(1000, 600)
			; Check for usable NRG Restore (L)
			If PixelCheckColorBool(660, 402, 0xCBD2FD) Then
				; Click once '+' button for 'NRG Restore (L) - 120 NRG Restoration Amount'
				SendInputTap(910, 500)
			EndIf
		EndIf
		; Click 'Restore' Button
		SendInputTap(850, 670)
		; Click 'OK' Button for 'Restore NRG popup - NRG has been restored.'
		SendInputTap(600, 520)
	EndIf
;	Sleep($timeout)

	; Screen: GAME OVER - Continue
	; Trigger Condition: Red outline of 'Give Up' button
	; Action: Click 'Give Up' button //Possibly code a config option in the future as a conditional statement to allow for 'Continue' instead of 'Give Up'
	If PixelCheckColorBool(315, 496, 0x88282B) Then
		;Sleep(2000)
		SendInputTap(420, 620)
		Sleep(500)
		; Click 'Yes' button in response to 'Do you really wish to give up?'
		SendInputTap(760, 520)
	EndIf
;	Sleep($timeout)

	; Screen: First Time Completion Rewards
	; Trigger Condition: Dark Brown of Visiore x50 background (near middle point)
	; Action: Click 'Next' button
	If PixelCheckColorBool(460, 120, 0x40372F) Then
		Sleep(1000)
		SendInputTap(1070, 670)
		Sleep(100)
		SendInputTap(1070, 670)
	EndIf
;	Sleep($timeout)

	; Screen: Experience/Gil
	; Trigger Condition: Yellow/orange of the Gil coin icon
	; Action: Click 'Next' button
	If PixelCheckColorBool(533, 126, 0xE8C33B) Then
		Sleep(1500)
		SendInputTap(1070, 670)
		Sleep(100)
		SendInputTap(1070, 670)
		Sleep(1500)
	EndIf
;	Sleep($timeout)

	; Screen: Friend Requests
	; Trigger Condition: Dark brown background bar of the Player's Name / Rank Level
	; Action: ; Click on 'Cancel' button, then click on 'Return' button
	If PixelCheckColorBool(400, 150, 0x332B29) Then
		Sleep(250)
		; 'Cancel' button
		SendInputTap(500, 630)
		Sleep(1000)
;TODO create a loop		; 'Return' button
		SendInputTap(1060, 660)
	EndIf
;	Sleep($timeout)

	; Screen: Acquired Items
	; Trigger Condition: Brown of Title Bar (after the Room Name)
	; Action: Click 'Return' button
	If PixelCheckColorBool(750, 80, 0x362E26) Then
		SendInputTap(1070, 660)
	EndIf
	Sleep($timeout)

	; Screen: 'Meeting new people award' Popup
	; Trigger Condition: Blue color of 'Blah' button
	; Action: Click 'Blah' button
;TODO

	; Screen: 'Date Change - A new day has begun' Popup
	; Trigger Condition: Blue color of 'Return to Title Screen' button
	; Action: Click 'Return to Title Screen' button
;TODO

WEnd
