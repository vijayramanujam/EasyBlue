
# EasyBlue - Bluetooth Device Manager script
simple and automated Bluetooth device management script for Linux systems. It leverages the bluetoothctl command-line utility to easily control and interact with Bluetooth devices, making Bluetooth device management more accessible and user-friendly.
## Features

- **Power On/Off Bluetooth**: Toggle Bluetooth power on or off.
- **Scan for Devices**: Start and stop scanning for nearby Bluetooth devices.
- **List Paired Devices**: View all currently paired Bluetooth devices.
- **Pair Devices**: Pair with a Bluetooth device using its MAC address.
- **Trust Devices**: Mark a Bluetooth device as trusted, allowing automatic future connections.
- **Connect/Disconnect Devices**: Connect or disconnect Bluetooth devices by MAC address.
- **Auto Connect**: Automatically connect to a predefined Bluetooth device.
- **Auto Disconnect**: Automatically disconnect all currently connected Bluetooth devices.
## Requirements
To run this project, you need the following Python libraries installed:

- Linux-based operating system with Bluetooth support.
- bluetoothctl utility (typically included in most Linux distributions).
- Sudo/root privileges may be required for certain commands.


## Run Locally

Clone the project

```bash
  git clone git@github.com:vijayramanujam/EasyBlue.git
```

Go to the project directory

```bash
  cd EasyBlue
```

Make the script executable

```bash
  chmod +x easyBlue.sh


```

Start the server

```bash
  ./easyBlue

```


## Usage / Examples

To power on and off
```
./easyblue.sh power_on / power_off

```

start / stop scanning for nearby devices
```
./easyblue.sh scan / stop_scan
```

pair with the MAC id

```
./easyblue.sh pair 00:XX:XX:33:XX:XX
```

trust the MAC id
```
./easyblue.sh trust 00:XX:XX:33:XX:XX
```

connect or disconnect the device
```
./easyblue.sh connect / disconnect 00:XX:XX:33:XX:XX

```

uses hotkeys (custom i3 config file) to auto_connect / disconnect
```
./easyblue.sh auto_connect / auto_disconnect
```
## License

This project is open-source and available under the  [MIT](https://choosealicense.com/licenses/mit/)

