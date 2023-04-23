# ADB and Fastboot Sniffer
### [NewBit @ xda-developers](https://forum.xda-developers.com/m/newbit.1350876)

### Description
This AutoIt Script can help you, sniffing out the commands,\
an ADB or Fastboot application sends to your device.

### Notes
* Tested on Windows
* The Windows executable file will be detected as a Virus [AutoIt and Malware](https://www.autoitscript.com/wiki/AutoIt_and_Malware)
	* hence, here you will only get the script (au3) file
* ADB Pull operations will save your file(s) as intended
* Write operations are not tested yet

## How it works
* rename the au3 file to the name of your target application, ie. adb.au3 or fastboot.au3
* compile the au3 file to an executable file with AutoIt V3
* rename your target application, ie. `adb_old.exe` or `fastboot_old.exe`
	* copy the au3 file executable right next to it
* perform your operations of your target application as usually
	* a log .txt file will be created and all the commands are logged into it
		* ie. `adbsniff.txt` or `fastbootsniff.txt`
* open the log file, and read your sniffed content

### Background
The compiled au3 file executable tees the arguments to the original file, and saves\
it to a logfile. The same happens the other way around, when the original file is\
sending something back, the compiled au3 file executable captures it, and tees\
it in a logfile and a real file if it was a pull.

### Change Logs
#### [April 2023]
* [General] - published initial version

### Credits
* [SciTE @ Scintilla](https://www.scintilla.org/SciTEDownload.html)
* [AutoIt V3 Script Editor](https://www.autoitscript.com/site/autoit-script-editor/downloads/)
