#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)


    if [ "$CHARGE" -lt 10 -a "$STATUS" != "Charging" ]; then
      notify-send -u critical "ﲌ Warning" " Battery is low. \n Connect to a charger!"
      mpv ~/.local/media/notif/low_battery.wav > /dev/null
    fi



    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf " %s%%" "$CHARGE"
        else
            if [ "$CHARGE" = 100 ]; then
                icon=""
            elif [ "$CHARGE" -ge 90 ]; then
                icon=""
            elif [ "$CHARGE" -ge 80 ]; then
                icon=""
            elif [ "$CHARGE" -ge 70 ]; then
                icon=""
            elif [ "$CHARGE" -ge 60 ]; then
                icon=""
            elif [ "$CHARGE" -ge 50 ]; then
                icon=""
            elif [ "$CHARGE" -ge 40 ]; then
                icon=""
            elif [ "$CHARGE" -ge 30 ]; then
                icon=""
            elif [ "$CHARGE" -ge 20 ]; then
                icon=""
            elif [ "$CHARGE" -ge 10 ]; then
                icon=""
            else
                icon=""
            fi
            echo "$icon $CHARGE"
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

