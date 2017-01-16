#! /bin/bash      
while :
do
    /usr/bin/avrdude -s -b 1000000 -V -v -v -c avrispmkII -P usb:000200212345 -pm2560 -Uflash:w:/home/bruce/workspace/RAMBo/bootloaders/stk500boot_v2_mega2560.hex:i -Uefuse:w:0xFD:m -Uhfuse:w:0xD0:m -Ulfuse:w:0xFF:m -Ulock:w:0x0F:m && MCU2560="\033[0;32m2560 Success!!" || MCU2560="\033[0;31m2560 FAILED TO PROGRAM !!!!!!!!!!!!!!!!"
    /usr/bin/avrdude -s -b 2000000 -V -v -v -c avrispmkII -P usb:000203212345 -patmega32u2 -Uflash:w:/home/bruce/workspace/RAMBo/bootloaders/RAMBo-usbserial-DFU-combined-32u2.HEX:i -Uefuse:w:0xF4:m -Uhfuse:w:0xD9:m -Ulfuse:w:0xEF:m -Ulock:w:0x0F:m && MCU32U2="\033[0;32m32u2 Success!!" || MCU32U2="\033[0;31m32u2 FAILED TO PROGRAM !!!!!!!!!"
    echo -e "${MCU32U2}\033[0m"
    echo -e "${MCU2560}\033[0m"
    beep -f 2200 -r 1
    echo "Ctrl+C to quit any other key to program"
    read -t .1 -n 10000 discard # discard buffered input
    read -n 1 -s
done