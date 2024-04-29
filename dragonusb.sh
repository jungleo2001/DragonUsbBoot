#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/iso /dev/sdX"
    exit 1
fi

ISO_FILE="$1"
USB_DRIVE="$2"

# Check if the ISO file exists
if [ ! -f "$ISO_FILE" ]; then
    echo "ISO file not found: $ISO_FILE"
    exit 1
fi

# Check if the USB drive exists
if [ ! -b "$USB_DRIVE" ]; then
    echo "USB drive not found: $USB_DRIVE"
    exit 1
fi

# Unmount USB drive if mounted
umount "$USB_DRIVE"* &>/dev/null

# Prompt the user for confirmation
read -p "WARNING: This will erase all data on $USB_DRIVE. Continue? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled"
    exit 1
fi

# Write ISO to USB drive using dd
echo "Writing ISO to USB drive..."
dd if="$ISO_FILE" of="$USB_DRIVE" bs=4M status=progress && sync

echo "Bootable USB created successfully!"
