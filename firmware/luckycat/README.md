# Setup

Install the the arduino-cli. To get the ESP definitions, a JSON file needs to be added to the board manager as an external resource.
Create a config file `arduino-cli config init` and add `https://arduino.esp8266.com/stable/package_esp8266com_index.json` to the newly created file.

Run `sh install.sh` to load the ESP files and install the Servo library.

The cheap ESP modules come with CH340G USB-to-UART bridges. Install at your discretion.

# Compile and Upload

Run `sh compile.sh && sh upload.sh`.

# Use

The CH340 driver offers two Virtual Serial Devices, `tty.usbserial-____` and `tty.wchusbserial____`. The latter is the correct one.
To move the arm to position, open a serial connection at 9600 baud and send a value between 0 and 180, terminted by a newline character.
