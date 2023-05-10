#NoTrayIcon
#include <Constants.au3>
#AutoIt3Wrapper_Change2CUI=y
#include <MsgBoxConstants.au3>
local $DEBUG = False
;$DEBUG = True
; This displays mesage box with the parameterized text
$args = $CmdLineRaw
;MsgBox($MB_SYSTEMMODAL, "ADB Hack!", $args)

local $FileName = StringSplit(@ScriptName, ".exe", 1)
if $DEBUG Then
	$FileName = StringSplit(@ScriptName, ".au3", 1)
EndIf

$FileName = $FileName[1]
Local $sTargetFile = @ScriptDir & '\' & $FileName & 'sniff.txt'
Local $cmd_old = $FileName & '_old.exe'
Local Const $cmd = @ScriptName

if $DEBUG Then
	ConsoleWrite("$cmd=" & $cmd & @CRLF)
	ConsoleWrite("$cmd_old=" & $cmd_old & @CRLF)
	ConsoleWrite("$sTargetFile=" & $sTargetFile & @CRLF)
EndIf

If Not FileExists($cmd_old) Then
	ConsoleWrite("Rename your Sniff Target to " & $cmd_old & @CRLF)
	Exit
EndIf

_WriteDataToLogFile($sTargetFile,$cmd & " " & $args & @CRLF)

$output=_RunWaitGet(@ComSpec & " /C " & $cmd_old & " " & $args, @ScriptDir, @SW_HIDE)

_WriteDataToLogFile($sTargetFile,$output)

ConsoleWrite($output)
;ConsoleWrite(@ScriptName)
;Run(@ComSpec & 'echo ' & $output, @ScriptDir, @SW_HIDE)

Func _WriteDataToLogFile($sFileName,$Data)
   Local $sWriteOption

   If FileExists($sFileName) Then
      $sWriteOption = $FO_APPEND
   Else
      $sWriteOption = $FO_OVERWRITE
   EndIf

   If IsBinary($Data) Then
	   $sWriteOption = $FO_OVERWRITE + $FO_BINARY
	   $sFileName=@ScriptDir & '\binary.img'
   EndIf

   Local $hFilehandle = FileOpen($sFileName, $sWriteOption)
   ;Local $sLogEntry = _Now() & ' - Writing line of text with date to log file' & @CRLF

   FileWrite($hFilehandle, $Data)
   FileClose($hFilehandle)
   ;MsgBox(0,"size="&StringLen($Data),$Data)
   ;MsgBox(0,"size="&$Data)
EndFunc

Func _RunWaitGet($sProgram,$sWorkingDir = @SystemDir,$nShowFlag = @SW_SHOW)
    Local $nRunOptFlags = 0,$sStreamOut = "" ; Initialize variables
    ; Determine flags for parent/child interaction
    $nRunOptFlags += $STDOUT_CHILD + $STDERR_MERGED
    Local $hRunStream = Run($sProgram,$sWorkingDir,$nShowFlag,$nRunOptFlags) ; Run the process
    If @error Then
		;MsgBox(0,"Error",@error)
		Return SetError(@error,@extended,0) ; If there was an error code, return it.  Otherwise...
	EndIf
    While 1 ; Loop until the end of the stream, which indicates that the process has closed it (which usually means the process ended)
		$sStreamOut &= StdoutRead($hRunStream) ; Append new stream contents to existing variable while removing those contents from the stream.
		;If @error = 2 Then ExitLoop ; If stream ended stop looping.
        If Not ProcessExists($hRunStream) Then ExitLoop ; If using the default setting and the process ended, stop looping.
        Sleep(100) ; To avoid overloading the CPU
    WEnd
    Return SetError(0,0,$sStreamOut) ; Return the captured contents and @error = 0
EndFunc