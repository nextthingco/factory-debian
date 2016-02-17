#!/bin/bash

SELECTION=$( dialog --stdout \
        --backtitle "What is my purpose in life?" \
        --menu "CHOOSE" \
        10 40 3 \
        1 "Flash station" \
        2 "HWTest station" \
)
clear

if [[ "$?" == "1" ]]
then
        echo "cancelled"
        exit 0
fi

if [[ "${SELECTION}" == "1" ]]
then
        echo "/home/debian/Desktop/CHIP-flasher/startFlash.sh &" > /home/debian/.config/openbox/autostart
        echo -e "\nxset -dpms & \nxset s noblank &" >> /home/debian/.config/openbox/autostart
        /home/debian/Desktop/CHIP-flasher/startFlash.sh &
else
        echo "~/Desktop/CHIP-flasher/startHardwareTest.sh &" > /home/debian/.config/openbox/autostart
        echo -e "\nxset -dpms & \nxset s noblank &" >> /home/debian/.config/openbox/autostart
        /home/debian/Desktop/CHIP-flasher/startHardwareTest.sh &
fi
