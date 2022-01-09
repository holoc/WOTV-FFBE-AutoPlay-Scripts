#cs -----------------------------------------------------------------------------------

 Script Version: 0.2.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running BlueStacks v5.5.10.1001 (Android Pie 64-bit (Beta))

 BlueStacks Settings

  Performance
	CPU allocation: Medium (2 Cores)
	Memory allocation: High (4 GB)
	Performance mode: Low Memory
	Frame rate: 30
	Enable high frame rate: OFF
	Enable VSync (to prevent screen tearing): OFF
	Display FPS during gameplay: OFF

  Display
	Display resolution: 960 x 540
	Pixel density: 240 DPI (Medium)
	Mouse cursor style: BlueStacks

  Graphics
	Graphics renderer: OpenGL
	Interface renderer: Auto
	ASTC textures (Beta): Hardware decoding
	GPU in use - NVIDIA GeForce GTX 1070/PCIe/SSE2
	Prefer dedicated GPU: YES

  Advanced
	Application binary interface (ABI) - x86 32-bit, x86 64-bit, ARM 32-bit, ARM 64-bit
	Android debug bridge - Connect to Android at 127.0.0.1:####: ON
	Input debugging - Show visual feedback for taps: ON
					- Show pointer location for current touch data: ON

  Instance manager settings
	Disable audio for all instances (Reduces CPU usage): Checked
	
Window layout (found under Multiple Instance Manager window -> Layout button)
	Window size - Customize - Width 960, Height 540

 Script Function:
	Contains the configuration options.

#ce -----------------------------------------------------------------------------------

; Depending on emulator/Windows settings, the following keyword may be required (uncomment to activate).
;#RequireAdmin

; Sets the relative coords used in the mouse/pixel functions to the active window
Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)

; Depending on the system/android emulator, this could be '127.0.0.1' or 'localhost' in order to connect ADB to the emulator instance
;test adb connection in commandline to confirm which one works. Port # can be found in BS under Advanced Settings, ADB information.
Global $adb_device_ip_address = "localhost"
Global $adb_device_port = ""

; Name of the BlueStacks Instance. Can be found under the BlueStacks multi-instance manager or AutoIt Window Info tool.
Global $hostWindowName = ""
Global $windowHandle = WinGetHandle($hostwindowName)

; Player Name used in logs.
Global $playerName = ""

; Multi Room Password provided in WOTV.
; Eventually, this value be stored for passing along commands to multiple instances over ADB.
Global $roomNumberCode = ""

; Legacy Variables required for Memu emulator ADB commands
Global $hostMemuVMSInstance = 1 ;Use "./memuc listvms -s" to determine which # instance your targetted