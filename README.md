# This Repo will be archived at the 24th of Oct 2023
# Due to the forced 2FA Mumbo Jumbo from GitHub,
# this Repo has moved to GitLab
# [ADB and Fastboot Sniffer](https://gitlab.com/newbit/ADB-and-Fastboot-Sniffer)
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
* the name of the au3 file doesn't matter
* compile the au3 file to an executable file with AutoIt V3
* rename the compiled executable to your target applications name ie. `adb.exe` or `fastboot.exe` or `sideload.exe`
* and rename your target application to, ie. `adb_old.exe` or `fastboot_old.exe` or `sideload_old.exe`
	* copy the compiled executable right next to it
* perform your operations of your target application as usually
	* a log .txt file will be created and all the commands are logged into it
		* ie. `adbsniff.txt` or `fastbootsniff.txt` or `sideloadsniff.txt`
* open the log file, and read your sniffed content

### Background
The compiled au3 file executable tees the arguments to the original file, and saves\
it to a logfile. The same happens the other way around, when the original file is\
sending something back, the compiled au3 file executable captures it, and tees\
it in a logfile and a real file if it was a pull.

### How To Install AutoIT V3
* Download and install [AutoIt Full Installation](https://www.autoitscript.com/site/autoit/downloads/)
* Download and install [SciTE4AutoIt3.exe](https://www.autoitscript.com/site/autoit-script-editor/downloads/)

### Change Logs
#### [May 2023]
* [General] - changed to independent file names
#### [April 2023]
* [General] - published initial version

### Credits
* [SciTE @ Scintilla](https://www.scintilla.org/SciTEDownload.html)
* [AutoIt V3 Script Editor](https://www.autoitscript.com/site/autoit-script-editor/downloads/)
