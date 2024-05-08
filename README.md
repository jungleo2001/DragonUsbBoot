# DragonUsbBoot

# Bash Script to Create Bootable USB Flash Drive from ISO

## Description:
This Bash script automates the process of creating a bootable USB flash drive from an ISO file. It utilizes the `dd` command to write the ISO image to the USB drive. Please ensure that you have the correct ISO file and specify the correct device for the USB drive, as this operation can potentially erase data on the USB drive.

## Prerequisites:
- Linux-based operating system
- Root privileges to run the script (`sudo`)

## Usage:
1. Save the script in a file, for example, `create_bootable_usb.sh`.
2. Make the script executable with the following command:
    ```bash
    chmod +x create_bootable_usb.sh
    ```
3. Run the script with the following command:
    ```bash
    sudo ./create_bootable_usb.sh /path/to/your.iso /dev/sdX
    ```
    Replace `/path/to/your.iso` with the path to your ISO file and `/dev/sdX` with the appropriate device identifier for your USB drive (e.g., `/dev/sdb`, `/dev/sdc`, etc.). Be cautious and ensure that you specify the correct device identifier to avoid overwriting important data.

## Warning:
- This script will erase all data on the specified USB drive. Please double-check the device identifier and ensure that you have selected the correct USB drive.
- Use this script at your own risk. The author is not responsible for any data loss or damage caused by the misuse of this script.

## Author:
Leonardo Jung
