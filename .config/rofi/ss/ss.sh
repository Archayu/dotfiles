#!/bin/sh

# ╭─────────────── ✦ ────────────────╮
#│        SCREENSHOT TOOL            │
# ╰─────────────── ✦ ────────────────╯


screenshotdir=~/Pictures/Screenshots
file=$screenshotdir/$(date '+%y%m%d-%H%M-%S').png
icon=~/.config/rofi/ss/camera.png
roficonfig=~/.config/rofi/ss/config.rasi
[ -d "$screenshotdir" ] || mkdir -pv "$screenshotdir"

area="󰩬"
cwin=""
full="󰹑"
copy=""
save="󰽄"

rofiopt="$area\n$cwin\n$full"
rofi=$(printf "$rofiopt" | rofi -config $roficonfig -dmenu -i )
[ -z "$rofi" ] && exit
option="$save\n$copy"
saveopt=$(printf "$option" | rofi -config $roficonfig -dmenu -i )

case $rofi in
    "$area")
        if [ "$saveopt" = "$copy" ]; then
            notify-send -i $icon --urgency low 'Select Area'
            grim -g "$(slurp)" - | wl-copy && \
            notify-send -i $icon --urgency low 'Screenshot copied' || \
            notify-send -i $icon 'Failed to take screenshot'
        elif [ "$saveopt" = "$save" ]; then
            notify-send -i $icon --urgency low 'Select Area'
            grim -g "$(slurp)" "$file" && \
            notify-send -i $icon --urgency low 'Screenshot Taken' || \
            notify-send -i $icon 'Failed to take screenshot'
        fi
        ;;
    "$cwin")
        # Hyprland active window geometry
        geom=$(hyprctl activewindow -j | jq -r '.at[0], .at[1], .size[0], .size[1]' | tr '\n' ' ' | awk '{print $1","$2" "$3"x"$4}')
        if [ "$saveopt" = "$copy" ]; then
            grim -g "$geom" - | wl-copy && \
            notify-send -i $icon --urgency low 'Screenshot copied' || \
            notify-send -i $icon 'Failed to take screenshot'
        elif [ "$saveopt" = "$save" ]; then
            grim -g "$geom" "$file" && \
            notify-send -i $icon --urgency low 'Screenshot Taken' || \
            notify-send -i $icon 'Failed to take screenshot'
        fi
        ;;
    "$full")
        if [ "$saveopt" = "$copy" ]; then
            sleep 2
            grim - | wl-copy && \
            notify-send -i $icon --urgency low 'Screenshot copied' || \
            notify-send -i $icon 'Failed to take screenshot'
        elif [ "$saveopt" = "$save" ]; then
            sleep 2
            grim "$file" && \
            notify-send -i $icon --urgency low 'Screenshot Taken' || \
            notify-send -i $icon 'Failed to take screenshot'
        fi
        ;;
esac
