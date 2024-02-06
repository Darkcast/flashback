#!/bin/bash

# Function to check if a command is available
check_command() {
  command -v "$1" >/dev/null 2>&1
}

# Function to print colored plus sign
print_message() {
  local color=$1
  local message=$2
  echo -e "\033[1;${color}m[+]\033[0m $message"
}

# Check if adb is installed
echo ""
echo "Checking requirements"
echo ""

if check_command adb; then
  print_message 32 "adb is installed."
else
  print_message 31 "Error: adb is not installed. Please install adb and try again.
  Make sure developer mode is enabled and that the machine recognizes the phone."
  exit 1
fi

# Check if proxmark3 is installed
if check_command proxmark3; then
  print_message 32 "proxmark3 is installed."
else
  print_message 31 "Error: proxmark3 is not installed. Please install proxmark3 and try again."
  exit 1
fi

echo ""

# Decoding and printing the ASCII Menu from base64
echo "IF9fX19fIF8gICAgICAgICBfICAgICAgX19fX18gICAgICAgICBfICAgCnwgICBfX3wgfF9fXyBfX198IHxfICAgfCBfXyAgfF9fXyBfX198IHxfIAp8ICAgX198IHwgLid8XyAtfCAgIHwgIHwgX18gLXwgLid8ICBffCAnX3wKfF9ffCAgfF98X18sfF9fX3xffF98ICB8X19fX198X18sfF9fX3xfLF98Cg==" | base64 -d
echo "                                Version 0.1"
echo "Now with 10% more disappointment than
the leading brand."
echo "==========================================="
echo " 1. Flash Firmware"
echo " 2. Sideload RFIDTools"
echo "==========================================="

read -p "Enter your choice (1 or 2): " choice

echo ""

case $choice in
  1)
    print_message 32 "Installing firmware"
    echo ""
    pm3 -p /dev/tty.usbmodemiceman1 --flash --unlock-bootloader --image bootrom.elf --image fullimage.elf --force
    ;;
  2)
    print_message 32 "Looking for devices"


    if check_command adb devices; then
      print_message 32 "Devices found"
      print_message 32 "Sideloading RFIDTools 1.4.9"
      echo ""
      # install and or replace existing application
      adb install -r RFIDTools_1.4.9.apk
    else
      print_message 31 "Error: adb devices not found.
      Make sure the phone is connected and developer mode is enabled and try again."
      exit 1
    fi
    ;;
  *)
    print_message 31 "Invalid choice. Please enter 1 or 2."
    ;;
esac
