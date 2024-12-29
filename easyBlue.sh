#!/bin/bash

# Function to turn Bluetooth on
function power_on {
    bluetoothctl power on
}

# Function to turn Bluetooth off
function power_off {
    bluetoothctl power off
}

# Function to start scanning for devices
function scan_devices {
    bluetoothctl scan on
}

# Function to stop scanning for devices
function stop_scan {
    bluetoothctl scan off
}

# Function to list paired devices
function list_devices {
    bluetoothctl devices
}

# Function to pair with a device
function pair_device {
    if [ -z "$1" ]; then
        echo "Usage: pair_device <MAC address>"
        exit 1
    fi
    bluetoothctl pair $1
}

# Function to trust a device
function trust_device {
    if [ -z "$1" ]; then
        echo "Usage: trust_device <MAC address>"
        exit 1
    fi
    bluetoothctl trust $1
}

# Function to connect to a device
function connect_device {
    if [ -z "$1" ]; then
        echo "Usage: connect_device <MAC address>"
        exit 1
    fi
    bluetoothctl connect $1
}

# Function to disconnect a device
function disconnect_device {
    if [ -z "$1" ]; then
        echo "Usage: disconnect_device <MAC address>"
        exit 1
    fi
    bluetoothctl disconnect $1
}

# Function to automatically connect to a device (using a hardcoded MAC address)
function auto_connect {
    DEVICE_MAC="40:72:18:0F:C3:F1"  # Replace with the MAC address of the device you want to connect
    echo "Connecting to device with MAC address $DEVICE_MAC..."
    bluetoothctl connect $DEVICE_MAC
}

# Function to automatically disconnect all currently connected devices
function auto_disconnect {
    # List all paired devices
    echo "Listing paired devices..."
    bluetoothctl paired-devices | while read -r line; do
        # Extract MAC address from paired devices list
        DEVICE_MAC=$(echo $line | awk '{print $2}')

        # Check if the device is currently connected
        if bluetoothctl info $DEVICE_MAC | grep -q "Connected: yes"; then
            echo "Disconnecting device with MAC address $DEVICE_MAC..."
            bluetoothctl disconnect $DEVICE_MAC
        fi
    done
}

# Main switch-case to process commands
case "$1" in
    "power_on")
        power_on
        ;;
    "power_off")
        power_off
        ;;
    "scan")
        scan_devices
        ;;
    "stop_scan")
        stop_scan
        ;;
    "list")
        list_devices
        ;;
    "pair")
        pair_device $2
        ;;
    "trust")
        trust_device $2
        ;;
    "connect")
        connect_device $2
        ;;
    "disconnect")
        disconnect_device $2
        ;;
    "auto_connect")
        auto_connect
        ;;
    "auto_disconnect")
        auto_disconnect
        ;;
    *)
        echo "Usage: $0 {power_on|power_off|scan|stop_scan|list|pair|trust|connect|disconnect|auto_connect|auto_disconnect}"
        exit 1
        ;;
esac

