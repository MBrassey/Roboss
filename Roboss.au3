#include <GUIConstantsEx.au3>
#include <ColorConstants.au3>
#include <WindowsConstants.au3>
#include <GuiButton.au3>
 
; Declare the flags and variables.
$Interrupt = 0
$EventCheck = 0
$WinTitle = "Roblox"
$WinText = ""
$Wisdom = 0
$SpeakSlowly = 0
$AwakeSlowly = 0
$Speaking = "No"
$SpeakingLabel = ""
$TimerLabel = ""
$Cycles = 0
$quiet = 0
$QuietDelay = 200
$last_pre_saying = 18 ; This will never be the first saying. 
Local $bFileInstall = True
; This will install the file C:\Test.bmp to the script location.
If $bFileInstall Then FileInstall( "C:\Users\Luc1d\code\Roboss\Roboss.jpg", "C:\ProgramData\Roboss.jpg")

; Declare the Wisdom.
Global $arr[57] 
$arr[0] = " Live as if you were to die tomorrow. Learn as if you were to live forever. "
$arr[1] = " Unless you try to do something beyond what you have already mastered, you will never grow. "
$arr[2] = " Buddha was asked, “What have you gained from meditation?” He replied, “Nothing!” However, Buddha said, let me tell you what I lost:Anger, Anxiety, Depression, Insecurity, Fear of Death. "
$arr[3] = " The best teachers are those who show you where to look, but don’t tell you what to see. "
$arr[4] = " Be kind, for everyone you meet is fighting a hard battle. "
$arr[5] = " Because the people who are crazy enough to think they can change the world, are the ones who do. "
$arr[6] = " Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step. "
$arr[7] = " In a time of deceit, telling the truth is a revolutionary act. "
$arr[8] = " Logic will get you from A to B. Imagination will take you everywhere. "
$arr[9] = " Everything that irritates us about others can lead us to an understanding of ourselves. "
$arr[10] = " I’m not in this world to live up to your expectations and you’re not in this world to live up to mine. "
$arr[11] = " Do not pray for an easy life. Pray for the strength to endure a difficult one. "
$arr[12] = " Never let school interfere with your education. "
$arr[13] = " The beautiful thing about fear is that when you run to it, it runs away. "
$arr[14] = " We can’t solve problems by using the same kind of thinking we used when we created them. "
$arr[16] = " Modern technologies are 99 percent bravery , and 1 percent investment. "
$arr[17] = " Bitcoin is the most stellar and most useful system of mutual trust ever devised. "
$arr[18] = " Cryptocurrency is freedom, Banking is slavery. "
$arr[19] = " We're moving from a centralized understanding of the world to a decentralized understanding of the world."
$arr[20] = " This Bitcoin currency is a voluntary decentralized currency, anonymous. It can't be shut down by anyone; there are no central servers. "
$arr[21] = " Absorb what is useful, discard what is useless and add what is specifically your own. "
$arr[22] = " The more we value things, the less we value ourselves. "
$arr[23] = " The successful warrior is the average man, with laser-like focus. "
$arr[24] = " In the middle of chaos lies opportunity. "
$arr[25] = " The key to immortality is first living a life worth remembering. "
$arr[26] = " When the mind is calm, how quickly, how smoothly, how beautifully you will perceive everything. "
$arr[27] = " Be kind to others, so that you may learn the secret art of being kind to yourself. "
$arr[28] = " Little stones that are pelted into the lake of consciousness should not throw the whole lake into commotion. "
$arr[29] = " I will not let anyone walk through my mind with their dirty feet. "
$arr[30] = " To believe in something, and not to live it, is dishonest. "
$arr[31] = " Truth never damages a cause that is just. "
$arr[32] = " Whenever you are confronted with an opponent. Conquer him with love. "
$arr[33] = " Strength does not come from physical capacity. It comes from an indomitable will. "
$arr[34] = " My Life is My Message. "
$arr[35] = " Love is the strongest force the world possesses and yet it is the humblest imaginable. "
$arr[36] = " A coward is incapable of exhibiting love, it is the prerogative of the brave. "
$arr[37] = " Speak only if it improves upon the silence. "
$arr[38] = " No one saves us but ourselves. No one can and no one may. We ourselves must walk the path. "
$arr[39] = " Live quietly in the moment and see the beauty of all before you. The future will take care of itself. "
$arr[40] = " The Way is not in the sky; the Way is in the heart. "
$arr[41] = " Peace comes from within. Do not seek it without. "
$arr[42] = " You will not be punished for your anger, you will be punished by your anger. "
$arr[43] = " The mind is everything. What you think you become. "
$arr[44] = " Better than worshiping gods is obedience to the laws of righteousness. "
$arr[45] = " A jug fills drop by drop. "
$arr[46] = " All wrong-doing arises because of mind. If mind is transformed can wrong-doing remain? "
$arr[47] = " Even death is not to be feared by one who has lived wisely. "
$arr[48] = " The journey of a thousand miles begins with one step. "
$arr[49] = " Great acts are made up of small deeds. "
$arr[50] = " He who conquers others is strong, He who conquers himself is mighty. "
$arr[51] = " It does not matter how slowly you go as long as you do not stop. "
$arr[52] = " Everything has beauty, but not everyone sees it. "
$arr[53] = " Wherever you go, go with all your heart. "
$arr[54] = " Better a diamond with a flaw than a pebble without. "
$arr[55] = " The object of the superior man is truth. "
$arr[56] = " Cryptocurrency is such a powerful concept that it can almost overturn governments. "
 
; Start up the GUI.
Opt("GUIOnEventMode", 1)
$hGUI = GUICreate("Roboss", 215, 132.88)
GUISetOnEvent($GUI_EVENT_CLOSE, "ThatExit")
$RunBtn = GUICtrlCreateButton("Stay Awake!", 10, 10, 80, 30)
GUICtrlSetOnEvent($RunBtn, "RunnerFunc")
$StopBtn = GUICtrlCreateButton("Stop", 10, 10, 80, 30)
GUICtrlSetOnEvent($StopBtn, "StopFunc")
$WiseBtn = GUICtrlCreateButton("SpeakWisdom", 10, 50, 80, 30)
GUICtrlSetOnEvent($WiseBtn, "WiseFunc")
$SpeakingLabel = GUICtrlCreateLabel("Speaking: " & $Speaking, 10, 88)
GUICtrlSetColor($SpeakingLabel, $COLOR_RED)
$TimerLabel = GUICtrlCreateLabel("RunCycles: " & $Cycles, 10, 106, 121)
GUICtrlSetColor($TimerLabel, $COLOR_RED)

; We want the stop button to be hidden when not needed, so we hide it for now.
GUICtrlSetState($StopBtn, $GUI_HIDE)
GUISetState()
GUIRegisterMsg($WM_COMMAND, "_WM_COMMAND") 
GUISetBkColor (0x000000, $hGUI )
GUICtrlCreatePic('C:\ProgramData\Roboss.jpg', 108, 2, 93, 124)
GUISetState(@SW_SHOW)
 
While 1
  Sleep(10)
  If $EventCheck = 1 Then
    ; This temporary return to the main loop, allows AutoIt to quickly handle system events
    ; such as GUI_EVENT_CLOSE. If we reached this far, then its safe to assume that
    ; there was no system events, and we can return to the RunnerFunc.
    RunnerFunc()
  EndIf
WEnd
 
Func RunnerFunc()
  ; This check avoids GUI flicker.
  If $EventCheck = 0 Then
    GUICtrlSetState($RunBtn, $GUI_HIDE)
    GUICtrlSetState($StopBtn, $GUI_SHOW)
  EndIf

  $Interrupt = 0
  $EventCheck = 0
  For $i = 0 To 1
    awake()
    if $Wisdom = 1 Then
    sayings()
    if $quiet >= $QuietDelay then QuietFunc()
    EndIf
    $Cycles = $Cycles + 1
    GUICtrlSetData ($TimerLabel, "RunCycles: " & $Cycles)
    ; Check for Interruption.
    If $Interrupt <> 0 Then
	  $EventCheck = 0
      Return
    EndIf
    ; Return to allow checking for system events.
    $EventCheck = 1
    Return
  Next
EndFunc
 
func awake()
  sleep(3000)
        If $AwakeSlowly = 0 Then ; Awake once at the beginning before waiting.
          If Not WinActive($WinTitle,"") Then WinActivate($WinTitle,"")
            WinWaitActive($WinTitle,"",2)
            Send("{BREAK}")
          EndIf
        $AwakeSlowly = $AwakeSlowly + 1
        If $AwakeSlowly >= Random(20,27) Then
          $AwakeSlowly = 0
        EndIf
EndFunc

func sayings()
  $quiet = $quiet + 1
  Opt("SendKeyDelay", 30)
    $pre_saying = Random(0,56)
      If $pre_saying = $last_pre_saying Then
        $pre_saying = Random(0,56)
      EndIf  
    $saying = $arr[$pre_saying]
    $last_pre_saying = $pre_saying
    If $SpeakSlowly = 0 Then ; Speak once at the beginning before waiting.
      If Not WinActive($WinTitle,"") Then WinActivate($WinTitle,"")
        WinWaitActive($WinTitle,"",2)
        send("/" & $saying)
        send("{ENTER}")
        $saying = ""
    EndIf
    $SpeakSlowly = $SpeakSlowly + 1
    If $SpeakSlowly >= Random(36,42) Then
      $SpeakSlowly = 0
    EndIf
EndFunc

Func WiseFunc()
  $Wisdom = 1
  $Speaking = "Yes"
  GuiCtrlSetState ($WiseBtn, $GUI_DISABLE)
  GUICtrlSetData ($SpeakingLabel, "Speaking: " & $Speaking)
EndFunc

Func QuietFunc()
  $Wisdom = 0
  $SpeakSlowly = 0
  $Speaking = "No"
  $saying = ""
  $quiet = 0
  GuiCtrlSetState ($WiseBtn, $GUI_ENABLE)
  GUICtrlSetData ($SpeakingLabel, "Speaking: " & $Speaking)
EndFunc

Func StopFunc()
  GUICtrlSetState($StopBtn, $GUI_HIDE)
  GUICtrlSetState($RunBtn, $GUI_SHOW)
  GuiCtrlSetState ($WiseBtn, $GUI_ENABLE)
  $Wisdom = 0
  $SpeakSlowly = 0
  $SpeakSlowly = 0
  $AwakeSlowly = 0
  $Speaking = "No"
  $Cycles = -1
  $saying = ""
  GUICtrlSetData ($SpeakingLabel, "Speaking: " & $Speaking)
  sleep(1000)
EndFunc

Func _WM_COMMAND($hWnd, $Msg, $wParam, $lParam)
  If BitAND($wParam, 0x0000FFFF) =  $StopBtn Then $Interrupt = 1
  Return $GUI_RUNDEFMSG
EndFunc

Func ThatExit()
   Exit
EndFunc