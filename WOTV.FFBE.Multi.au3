#cs -----------------------------------------------------------------------------------

 Script Version: 0.2.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running Memu(Android 7.1, 64bit)

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
	Basic AutoIt script for FFBE WOTV Multi-Events.
	Script will be triggered once in a Multi-Event session.
	When in waiting in the Multi-Event room...
	Click 'Ready' button, then wait for host to Embark (unless you are the host, then you click the 'Embark' button)

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

	; Role: PARTICIPANT (person joining in the hosted room)

	; Screen: Multi-Quest Embarkment Room
	; Trigger Condition: Red color of the unpressed 'Disband / Leave Room' button
	; Action: Click 'Ready' button
	If PixelCheckColorBool(580, 536, 0x99262F) Then
		SendInputTap(1080, 670)
	EndIf
	Sleep($timeout)

	; Screen: Friend Requests
	; Trigger Condition: Dark brown background bar of the Player's Name / Rank Level
	; Action: Click on 'Cancel' button, then click on 'Return' button
	If PixelCheckColorBool(400, 150, 0x332B29) Then
		Sleep(250)
		; 'Cancel' button
		SendInputTap(500, 630)
		Sleep(1000)
;TODO create a loop		; 'Return' button
		SendInputTap(1060, 660)
	EndIf
	Sleep($timeout)

	; Screens: Experience/Gil, Acquired Items
	; Trigger Condition: Red part of Quartet
	; Action: ; Click on 'Next' / 'Return' button
	If PixelCheckColorBool(130, 71, 0xC6631A) Then
		SendInputTap(1070, 680)
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
