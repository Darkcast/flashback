 ```
  ______ _           _       _                _
 |  ____| |         | |     | |              | |
 | |__  | | __ _ ___| |__   | |__   __ _  ___| | __
 |  __| | |/ _` / __| '_ \  | '_ \ / _` |/ __| |/ /
 | |    | | (_| \__ \ | | | | |_) | (_| | (__|   <
 |_|    |_|\__,_|___/_| |_| |_.__/ \__,_|\___|_|\_\

```

# Flashback Script

## Overview
Issue: the proxmark3_X accompanying software (RFID Tools) is not compatible with the latest version of the PM3 Software.
This script has the appropriate apk version and pm3 software supported by the developer.
This will allow you to run the hardware via BT.

## Prerequisites
Make sure you have the following software installed:
- adb (Android Debug Bridge)
- proxmark3

## Usage
1. Clone the repository or download the script.
2. Grant execute permissions to the script: `chmod +x flashback.sh`
3. Run the script: `./flashback.sh`

## Menu Options
The script provides a menu with the following options:
1. Flash Firmware
2. Sideload RFIDTools

Choose the desired option by entering `1` or `2` and follow the on-screen instructions.

## Actions
- **Flash Firmware (Option 1):** Installs firmware using the `pm3` tool.
- **Sideload RFIDTools (Option 2):** Sideloads RFIDTools 1.4.9 using adb.

## Notes
- Ensure that developer mode is enabled, and the machine recognizes the phone for adb operations.
- The script checks for the presence of adb and proxmark3 before proceeding.
- unless you install and older pm3 client this will give you an error when trying to use it on a computer.
