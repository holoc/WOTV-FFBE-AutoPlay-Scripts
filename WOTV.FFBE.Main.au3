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
	AutoIt script containing the includes to the main files.

#ce -----------------------------------------------------------------------------------

#include <AutoItConstants.au3>
#include <WOTV.FFBE.Functions.au3>
