#cs -----------------------------------------------------------------------------------

 Script Version: 0.1.0
 AutoIt Version: 3.3.14.5
 Author:         holoc
 Platform:		 Windows 10 running NoxPlayer (Android 5.1.1) running with Smart Launcher 5
 Perofrmance settings: High (4 Core CPU, 4096 MB Memory)
 Graphics rendering mode: Speed (DirectX)
 Resolution setting:
	Resolution - Tablet(960x540)
	Window size - Width 960, Height 540, DPI 160
 Game Settings:
	Frame settings: 30 FPS
	Mouse accelration: Turn off mouse acceleration in Windows
 Script Function:
	AutoIt script to reroll WOTV accounts by:
	- clearing the app cache (due to the intro video crashing the app in the emulator)
	- creating a new account,76
	- walking through the game tutorial,
	- doing featured summons,
	- sort units by descending rarity and taking a screenshot
	- make a backup of the pinfo file on FTP with a screenshot of the same file name

#ce -----------------------------------------------------------------------------------

#include <WOTV.FFBE.Main.au3>

; Start Screen Capture Video Recording (F9 shortcut key for Camtasia)
Send("{F9}")
Sleep(6000)

;CleanCacheWOTV($hostWindowName)
;Sleep(7000)

; Selects the emulator window defined in the Config file.
StartWOTV($hostWindowName)

; Click 'New Game' button
PixelCheckColor(550, 280, 0x736B52)

; Terms and Conditions - Click 'Agree' button
PixelCheckColor(550, 430, 0x180860)

; Age Verification - Click 'I am 16 years or older.' button
PixelCheckColor(500, 290, 0x736B52)

; Advertising Consent - Click 'Non-Personalized' button
PixelCheckColor(500,395, 0x736B52)

; Account Binding - Click 'Guest' button
PixelCheckColor(500,400, 0x736B52)

; Enter Player Name (using default given random generated name) - Click 'Confirm' button
;PixelCheckColor(550, 395, 0x140446)

; Enter Player Name (using Player Name given in Config file)
PixelCheckColor(597, 281, 0x4A423A)
Send("{BACKSPACE 12}")
Send($playerName)
;Send("{ENTER}")
; Click 'Confirm' button
PixelCheckColor(551, 395, 0x140446)

; Download Data - Check 'No Voiceover (less data consumption)' radio button and click 'Download' button
;PixelCheckColor(310, 293, 0x2E2926)
;PixelCheckColor(500, 430, 0x140446)

; Download Data - Downloading the tutorial and necessary data - Click 'Ok' button
;PixelCheckColor(500, 410, 0x140446)
;Sleep(3000)

; Skip forward scene - The Ardra continent, once of the realm of Lapis...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)
Sleep(3000)

; Skip forward scene
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)

; Sterne Leonis - I shall lure them from the front. Brother, circle around behind the bombs!
PixelCheckColor(104, 68, 0x665D76, 812, 141)

; Moving - Tap the green panel and move to the bomb's rear side.
PixelCheckColor(699, 444, 0xFFEF94, 699, 501)

; Attacking - Tap Attack and then Confirm to launch an attack on the bomb.
PixelCheckColor(488, 169, 0x00FFFF, 762, 529)
; Click on 'Attack' button
PixelCheckColor(762, 529, 0x1A18A9)
; Click on 'Confirm' button
PixelCheckColor(897, 514, 0x5A16A5)

; Waiting - Your turn will end after performing an action and tapping Confirm.
PixelCheckColor(481, 199, 0x00FFFF, 897, 518)
PixelCheckColor(897, 518, 0x5D15AF)

; Sterne Leonis - Are you all right, Brother!? We could really do with some reinforcements right about now...
PixelCheckColor(104, 68, 0x665D76, 812, 141)

; Mont Leonis - Let's use the ring entrusted to me by Father...Please, lend us your power!
PixelCheckColor(118, 66, 0xDBC299, 812, 141)

; Abilities - You can consume TP and AP to use a variety of abilities.
PixelCheckColor(458, 200, 0x00FFFF, 857, 433)
Sleep(500)
; Click on 'Ability' button
PixelCheckColor(857, 433, 0x5DA6EE)
; Click on 'Blizzard' Ability button
PixelCheckColor(712, 228, 0xDFC6C6)
; Click on 'Confirm' button
PixelCheckColor(897, 514, 0x5A16A5)
; Click on 'Ability Activation Target - Unit' button
PixelCheckColor(887, 535, 0x333B6D)
; Click on 'Confirm' button
PixelCheckColor(897, 514, 0x5A16A5)

; Medienna - Mighty Crystals, Seal Away All Warmth! Freeze--Blizzard!
PixelCheckColor(136, 169, 0xFFE0C8, 812, 141)
Sleep(4000)

; Sterne Leonis - So this is a vision! All right, finish it with your Limit Burst next, Brother!
PixelCheckColor(104, 68, 0x665D76, 812, 141)

; Limit Bursts - These are powerfull inherent abilities possessed by specific units.
; Though they are quite formidable skills, they consume large amounts of AP.
PixelCheckColor(603, 212, 0x00FFFF, 829, 464)
; Click on 'Ability' button
PixelCheckColor(829, 464, 0x1E24CA)
; Click on 'Destiny's Cross' Limit Burst button
PixelCheckColor(850, 214, 0x521814)
; Click on 'Confirm' button
PixelCheckColor(897, 514, 0x5A16A5)
; Quest Clear
Sleep(10000)

; Sterne Leonis - Nicely done, Brother! The villagers have been saved. Let us return to the castle.
PixelCheckColor(104, 68, 0x665D76, 812, 141)
Sleep(5000)

; Skip forward scene - After the successful battle...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)
Sleep(1000)

; Skip forward scene - Lady Macherie carriage in the woods...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)

; Schuzelt - Lady Macherie, allow me to assist you!
PixelCheckColor(113, 114, 0x7B4141, 812, 141)

; Macherie Hourne - Do as you like. that said, our foe is in an incredibly high area...
; I imagine you will have a difficult time wielding your sword.
PixelCheckColor(94, 208, 0xFFC8E0, 812, 141)

; Height - Range and Area of Effect are restricted by height.
; Be sure to consider height differences when attacking enemies.
PixelCheckColor(377, 155, 0x00FFFF)
; Take command of Macherie and use Banish on the enemy zuu.
PixelCheckColor(584, 156, 0x00FFFF)
; Move to green target spot
PixelCheckColor(397, 238, 0xFFE98E, 397, 294)
; Click on 'Ability' button
PixelCheckColor(832, 456, 0x1B1CAA)
; Click on 'Banish' Ability button
PixelCheckColor(712, 304, 0xDFC6C6)
; Click on 'Confirm' button
PixelCheckColor(896, 520, 0x5816A5)
; Click on 'Ability Activation Target - Unit' button
PixelCheckColor(887, 535, 0x333B6D)
; Click on 'Confirm' button
PixelCheckColor(897, 515, 0x5A17A8)

; Schuzelt - Excellent, Lady Macherie! If you cast Banish, you will be able to attack before the zuu!
PixelCheckColor(113, 114, 0x794040, 812, 141)
Sleep(1000)
MouseClick("left", 812, 141)

; Macherie Hourne - All right. I shall deliver one more blow!
PixelCheckColor(229, 87, 0x282014, 812, 141)
; Click on 'Next>>' button
PixelCheckColor(749, 531, 0x140446)
; Click on 'Next>>' button
PixelCheckColor(749, 531, 0x140446)
; Click on 'Next>>' button
PixelCheckColor(749, 531, 0x140446)
Sleep(2000)
; Macherie Hourne - What's this!?
PixelCheckColor(106, 97, 0xFFE0C8, 812, 141)
Sleep(2000)
; Macherie Hourne - Ugh, feisty, I see...
PixelCheckColor(106, 97, 0xFFE0C8, 812, 141)
; Schuzelt - Lady Macherie, please withdraw! I shall bring it down!
PixelCheckColor(116, 97, 0xFFD7BE, 812, 141)
Sleep(10000)
; Schuzelt - A...behemoth!? Lady Macherie, I shall keep them at bay. I beg you, return to the carriage!
PixelCheckColor(116, 97, 0xFFD7BE, 812, 141)
Sleep(4000)
; Schuzelt - You shall not touch her! I will fell you now!
PixelCheckColor(116, 97, 0xFFD7BE, 812, 141)
Sleep(6000)
; Schuzelt - Gah...! Lady Macherie, what are you doing! Quickly, to the carriage--!
PixelCheckColor(116, 97, 0xFFD7BE, 812, 141)
Sleep(6000)
; Macherie Hourne - Worry not, Schuzelt. I shall use the relic Father bestowed upon me.
PixelCheckColor(106, 97, 0xFFE0C8, 812, 141)
; Evocation Magic - Units equipped with espers can use the Evocation Gauge to perform Evocation Magic.
PixelCheckColor(341, 202, 0x00FFFF)
; Click on the yellow arrow.
PixelCheckColor(579, 421, 0xFFEF94, 580, 480)
; Macherie Hourne - May they burn to coals by the power of Ifrit!
PixelCheckColor(106, 97, 0xFFE0C8, 812, 141)
; Click on 'Ifrit' summon button
PixelCheckColor(897, 192, 0xEAEAEA, 910, 276)

; Click on 'Hellfire' Evocation Magic button
PixelCheckColor(787, 213, 0x36551D)
; Click on 'Confirm' button
PixelCheckColor(884, 446, 0xEAEAEA, 896, 518)
; Click on 'Ability Activation Target - Unit' button
PixelCheckColor(887, 535, 0x333B6D)
; Click on 'Confirm' button
PixelCheckColor(884, 446, 0xEAEAEA, 896, 518)
; Macherie Hourne - ...
PixelCheckColor(106, 97, 0xFFE0C8, 812, 141)
; Click on 'Skip' button for Ifrit summon animation scene
PixelCheckColor(866, 54, 0x07070F)
; Click on 'Next>>' button
PixelCheckColor(749, 531, 0x140446)
; Click on 'Next>>' button
PixelCheckColor(749, 531, 0x140446)
; Click on 'Next>>' button
PixelCheckColor(749, 531, 0x140446)

; Skip forward scene - Hourne Soldier - I-incredible...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)
; Click on 'Skip' button for WOTV Intro animation scene
PixelCheckColor(893, 48, 0x070707)

; Ramada - Lord Mont. Good work subduing those monsters.
PixelCheckColor(841, 448, 0xFCE3CB, 743, 509, 1000)
; Ramada - The quickest way to attaining victory in battle is to enhance your fighting power.
; ...So, let us start with a summon.
PixelCheckColor(841, 448, 0xFCE3CB, 743, 509, 1000)
; Ramada - Next time, the vision will not disappear so suddenly like that one did just now.
PixelCheckColor(842, 449, 0xFDDCC7, 743, 509, 1000)
; Click on 'Summon' button
PixelCheckColor(189, 458, 0xECECEC, 205, 537)
; Ramada - Lord Mont. Good work subduing those monsters.
PixelCheckColor(841, 448, 0xFCE3CB, 743, 509)
; Ramada - Performing a summon requires Visiore. I have prepared some for you this time,
; ...so go ahead and use it.
PixelCheckColor(841, 448, 0xFCE3CB, 743, 509)
; Click on '10x Summon' button
PixelCheckColor(79, 553, 0x350166, 79, 553)
; Click on 'Summon' button
PixelCheckColor(581, 410, 0x140446)
; Click on 'Skip' button
PixelCheckColor(871, 58, 0x090911)
; Click on 'Skip' button
PixelCheckColor(811, 521, 0x140446)
Sleep(2000)
; Ramada - More trustworthy friends have joined your ranks!
; Let us now head to the throne room. I am certain King Oelde is awaiting us.
PixelCheckColor(841, 448, 0xFCE3CB, 743, 509, 1000)
; Click 'OK' button
PixelCheckColor(582, 548, 0x170759)
; Click 'Return' button
PixelCheckColor(19, 56, 0x080808)

; Story Quests - This is the most important mode for progressing through the game.
; ...Playing Story Quests will unlock various other game modes.
PixelCheckColor(395, 211, 0x00FFFF)
Sleep(500)
MouseClick("left", 395, 211)
; Click 'Story' button
PixelCheckColor(752, 476, 0xEDEDED, 760, 534)
; Click 'Battle 1 - Twin Princes' button
PixelCheckColor(687, 198, 0x632929)
; Ramada - We are about to embark at last. But first, let us form our party with
; ...the units we summoned earlier.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click Party 1's 2nd character slot
PixelCheckColor(284, 345, 0xEDEDED, 274, 271)
; Click suggested character
PixelCheckColor(111, 527, 0xEFEFEF, 108, 441)
; Ramada - The members of your party have been chosen. Next, let us choose a companion.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click on Companion slot
PixelCheckColor(836, 347, 0xEEEEEE, 829, 280)
; Ramada - Companions are essentially mercenaries. We can pay them gil to have them fight alongside us.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; You can pay gil to invite another palyer's unit to accompany you on your quest.
PixelCheckColor(368, 183, 0x00FFFF)
; Normally, you must pay gil to acquire a companion, but this time only you may do so for free.
PixelCheckColor(472, 199, 0x00FFFF, 368, 183)
; Click on Trial Companion
PixelCheckColor(177, 336, 0xEDEDED, 80, 300)
; Ramada - Now our party is in full formation. Shall we set the auto function to "ON" and
; ...and embark? The auto setting can be switched on or off even mid-battle.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Set Auto to 'ON'
PixelCheckColor(254, 495, 0xEDEDED, 236, 546)
; Click 'Embark' button
PixelCheckColor(816, 470, 0xEDEDED, 829, 549)
; Skip forward scene - ...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)
Sleep(1000)
; Skip forward scene - ...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)
Sleep(1000)
; Skip forward scene - ...
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)
; Battle 1 Quest on Auto
; Battle 1 Rewards Screen
; Click 'Next' button
PixelCheckColor(782, 544, 0x180852)
Sleep(500)
PixelCheckColor(782, 544, 0x180852)
; Rank Up
; Ramada - Congratulations! You have ranked up.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; When you go up in rank, your NRG will be fully restored, and your maximum NRG and
; ...number of friends will increase.
PixelCheckColor(336, 167, 0x00FFFF, 783, 545)
; Click 'Next' button
PixelCheckColor(797, 488, 0xEDEDED, 783, 545)
; Ramada - Now then, shall we head back?
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click 'Complete Quest' button
PixelCheckColor(797, 480, 0xEDEDED, 806, 542)

; Skip forward scene - Mont Leonis - I-I did it!
PixelCheckColor(940, 108, 0xF2F2F2)
PixelCheckColor(930, 59, 0x07070B)

; Story Quests - Advance the Story by Conquering Story Quests!
; You'll acquire bonus RANK EXP & Visiore the first time you clear each Quest!
; Click 'Next>>' button
PixelCheckColor(754, 535, 0x140446)
; Click 'Close' button
PixelCheckColor(754, 535, 0x140446)

; Ramada - Good work in battle. I shall provide some brief explanations regarding the Home screen.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; When you receive items such as a Login Bonuses or
; Ranking Rewards, you can obtain them from the
; Presents menu. Be sure to check it oftne.
PixelCheckColor(413, 172, 0x00FFFF, 826, 394)

; Ramada - Next, regarding Missions..
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; By clearing missions every day, you can more or
; less play all elements of the game.
PixelCheckColor(623, 158, 0x00FFFF, 826, 311)

; Ramada - Now, I shall explain Challenge Missions
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; The most important points to learn when starting out
; have been arranged in a bingo-style mission board.
; You can earn rewards for each mission you clear.
PixelCheckColor(685, 173, 0x00FFFF, 826, 220)

; Ramada - Lastly, regarding the Beginner's Hall...
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; You can learn the basics of battle by questing in the
; Beginner's Hall. Clearing these quests will earn you
; Visiore.
PixelCheckColor(500, 202, 0x00FFFF, 653, 402)

; Ramada - The Beginner's Hall in particular rewards new
; recruits with plenty of useful items, so I highly recommend paying it a visit.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; Home - Claim Your Presents
; Tap the Presents button to receive Login Bonuses and other rewareds.
; Click 'Next>>' button
PixelCheckColor(751, 532, 0x140446)
; Complete Missions to Save up Progress Points and Earn Rewards!
; Keep on playing and clear Milestones too!
; Click 'Next>>' button
PixelCheckColor(751, 532, 0x140446)
; Clear Challenge Missions
; Click 'Next>>' button
PixelCheckColor(751, 532, 0x140446)
; Clear Beinner Quests and Deepen Your Knowledge of Battle!
; Click 'Close' button
PixelCheckColor(751, 532, 0x140446)

; Ramada - By the way, Lord Mont. Are you aware of an item known as an EXP Cube?
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click 'Units' button
PixelCheckColor(842, 226, 0xE4E4E4, 912, 209)
; Click on Mont unit
PixelCheckColor(113, 343, 0xECECEC, 103, 220)
; Ramada - Supposedly, that cube can grant battle experience
; in an instant simply by holding it in your hand and
; making a silent wish.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click 'Enhance' button
PixelCheckColor(381, 49, 0xECECEC, 412, 109)
; • Enhancing Units via EXP Cubes •
; By acquiring EXP, units will level up and receive a
; stat boost.
PixelCheckColor(512, 171, 0x00FFFF)
; S Cubes are used successfully with low-level units,
; while M and L Cubes are better used on high-level
; units.
PixelCheckColor(615, 171, 0x00FFFF, 615, 290)
; Click '+' button
PixelCheckColor(611, 292, 0xD6D6F7)
; Click 'Confirm' button
PixelCheckColor(613, 530, 0x140446)
; Click 'Confirm' button for Confirm Unit Batch Enhance
PixelCheckColor(548, 467, 0x140446)
; Ramada - Congratulations! As your level has increased, you
; are now able to increase your Job level as well.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; • Enhancing Jobs •
; Gather enough essential items and you can
; enhance your unit's Main Job.
PixelCheckColor(398, 199, 0x00FFFF, 743, 509)
; Ramada - I have prepared the necessary materials, so go
; ahead and use them.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click 'Job Enhance' button
PixelCheckColor(731, 524, 0x140446)
; Click 'Enhance' button
PixelCheckColor(643, 500, 0x140446)
; As a Job's level increases, bonuses will be applied
; to the unit's stats...
PixelCheckColor(495, 157, 0x00FFFF)
; ...
PixelCheckColor(652, 172, 0x00FFFF, 495, 157)

; Ramada - Your Job level has increased. Now, we shall
; enhance your abilities.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click 'Abilities' button
PixelCheckColor(741, 57, 0xECECEC, 767, 111)
; Click 'Ability Enhance' button
PixelCheckColor(648, 490, 0xECECEC, 659, 552)
; Click 'Enhance' button
PixelCheckColor(827, 155, 0xECECEC, 848, 199)
; Click 'OK' button on Ability Lv. Up window for Stone Throw enhanced to Lv.2
PixelCheckColor(470, 369, 0xECECEC, 491, 431)
; • Enhancing Abilities •
; Enhancing abilities requires JP and gil.
PixelCheckColor(570, 184, 0x00FFFF)
; Enhancing will boost the following stats:
; -Attack-Type Ability Damage
; -Buff/Debuff Ability Effects
; -Status Ailment Ability Effects
PixelCheckColor(540, 181, 0x00FFFF, 570, 184)
; Ramada - Though you currently possess only a few types of
; abilities, I am looking forward to witnessing your
; growth and seeing you master a diverse array of
; skills...
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)
; Click Back button
PixelCheckColor(95, 69, 0xE7E7E7, 34, 55)
Sleep(1000)
; Click Back button
PixelCheckColor(95, 69, 0xE7E7E7, 34, 55)
Sleep(1000)
; Click Back button
PixelCheckColor(95, 69, 0xE7E7E7, 34, 55)
Sleep(1000)
; Click Back button
PixelCheckColor(95, 69, 0xE7E7E7, 34, 55)
Sleep(1000)
; Ramada - That is all the basic information you need to know
; for now. Try progressing through Story Mode to
; unlock more features.
PixelCheckColor(811, 524, 0xC6FFFF, 743, 509, 1000)

; Unit Enhancement - Enhance Your Units
; The type of EXP Cube you can use varies by unit Lv.!
; Click 'Next>>' button
PixelCheckColor(751, 532, 0x140446)
Sleep(1000)
; Collect Enhancing Materials and Raise Your Units' Stats!
PixelCheckColor(751, 532, 0x140446)
Sleep(1000)
; You'll Need JP and Gil to Unlock and Enhance Abilities
; Click 'Close' button
PixelCheckColor(751, 532, 0x140446)
Sleep(1500)

; Beginner's Login Bonus - Got Rewards! Visiore x200
; Click reward
PixelCheckColor(500, 439, 0xFFFFFF, 480, 545, 1000)
Sleep(500)
; Click 'Close' button
PixelCheckColor(453, 541, 0x140446, 480, 545)
Sleep(1500)

; Early Summer Login Bonus - Got Rewards! Visiore x500, EXP Cube (M) x30
; Click reward
PixelCheckColor(475, 431, 0xFFFFFF, 480, 545, 1000)
Sleep(500)
; Click 'Close' button
PixelCheckColor(453, 541, 0x140446, 480, 545)
Sleep(4000)

; June Login Bonus - Next Present
; Click 'Close' button
PixelCheckColor(800, 530, 0x140446, 800, 530, 1000)
;Sleep(500)

; New Units & Vision Card!
; Click 'X' button.
PixelCheckColor(838, 90, 0xCCD4FF)
;Sleep(500)

; Notices
; Click 'X' button.
PixelCheckColor(837, 74, 0xD2D2FF)
;Sleep(500)

; Video Summon
; Click 'Cancel' button.
PixelCheckColor(313, 529, 0x0F070F)
; Click 'Continue' button.
;PixelCheckColor(554, 531, 0x140446)
;Sleep(500)
; Download Data
; Click 'OK' button
;PixelCheckColor(458, 421, 0x140446)
;Sleep(500)

; Click 'Presents' button
PixelCheckColor(826, 395, 0xB16F80)
; Click 'Claim All' button
PixelCheckColor(752, 537, 0x140447)
Sleep(6000)
; Click 'OK' button for Presents Claimed screen
PixelCheckColor(455, 510, 0x140446, 455, 510, 1000)
; Click 'X' button to go back to Home screen.
PixelCheckColor(885, 59, 0xCED3FF)

; Click 'Summon for Visiore!' button
PixelCheckColor(740, 200, 0xBD1847)
; Click 'Up Arrows' button
PixelCheckColor(844, 159, 0xD9C28E)
; Click 'Early Summer 1 Time Free 10x Summon!' button
PixelCheckColor(840, 211, 0xFAFDFF)
; Click '10x Summon' button
PixelCheckColor(82, 539, 0x5F0EC3)
; Click 'Summon' button
PixelCheckColor(522, 421, 0x140446)
Sleep(3000)
; Click 'Skip' button
PixelCheckColor(878, 57, 0x07070F)
; Screenshot (Ctrl+3 depending on how you set it up in Nox Player)
Sleep(2000)
Send("^3")
; Click 'OK' button
PixelCheckColor(447, 535, 0x140446)
; Click 'Ticket Summon List' button
PixelCheckColor(849, 534, 0x080808)
; Click 'Summon' button for MR+ Guaranteed Unit Summon Ticket A
PixelCheckColor(574, 234, 0x140446)
; Click 'Summon' button
PixelCheckColor(584, 471, 0x140446)
Sleep(3000)
; Click 'Skip' button
PixelCheckColor(878, 57, 0x07070F)
; Screenshot (Ctrl+3 depending on how you set it up in Nox Player)
Sleep(2000)
Send("^3")
; Click 'OK' button
PixelCheckColor(564, 538, 0x140446)
; Click 'Back' button
PixelCheckColor(36, 58, 0x080808)

; Click on 'Missions' button
PixelCheckColor(826, 308, 0xB3C4CD)
; Click '>>' button
PixelCheckColor(828, 160, 0x822F2F, 752, 61, 1000)
; Click 'Training' button
PixelCheckColor(800, 117, 0x110919)
; Click 'Make More Friends' button
PixelCheckColor(255, 288, 0x80562D)
; Click 'Claim All' button
PixelCheckColor(746, 540, 0x140446)
; Click 'OK' button
PixelCheckColor(460, 474, 0x140446)
; Click 'X' button to go back to Home creen.
PixelCheckColor(939, 53, 0xCED0FD)

; Should now have enough visiore for New Unit/Vision Card Summon
; Click 'Summon' button for New Unit/Vision Card Summon
PixelCheckColor(576, 98, 0xCD2020)
; Click '10x Summon' button
PixelCheckColor(232, 536, 0x5C02A0, 232, 536, 1000)
; Click 'Summon' button for Summon with Visiore
PixelCheckColor(533, 420, 0x140446)
; Click 'Skip' button
PixelCheckColor(878, 57, 0x07070F)
; Click 'OK' button for Claim Rewards
PixelCheckColor(454, 451, 0x140449)
; Screenshot (Ctrl+3 depending on how you set it up in Nox Player)
Sleep(2000)
Send("^3")
; Click 'OK' button
PixelCheckColor(556, 534, 0x140446)
; Click 'Back' button
PixelCheckColor(36, 58, 0x080808)
; Click 'Unit' button
PixelCheckColor(916, 202, 0xBDBDCE)
; Click 'Obtained' button
PixelCheckColor(832, 539, 0x070707)
; Click 'Rarity' button
PixelCheckColor(378, 208, 0x342C2C)
; Click 'Descending' button
PixelCheckColor(379, 452, 0x2F2727)
; Click 'Confirm' button
PixelCheckColor(665, 457, 0x140446)
; Screenshot (Ctrl+3 depending on how you set it up in Nox Player)
Sleep(1000)
Send("^3")

; Terminate Screen Capture Video Recording (F10 with Camtasia)
Send("{F10}")
Sleep(2000)
WinActivate("TechSmith Camtasia")