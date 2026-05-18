#!/bin/bash

scripts=(
"$HOME/.config/quickshell/scripts/cliphist-visual.sh"
"$HOME/.config/matugen/scripts/papirus/change-icon.sh"
"$HOME/.config/rofi/launchers/launcher.sh"
"$HOME/.config/rofi/ss/ss.sh"
"$HOME/.config/rofi/wallpaper/wall.sh"
)

for script in "${scripts[@]}"; do
    if [ -f "$script" ]; then
        chmod +x "$script"
        echo "✓ Made executable: $script"
    else
        echo "✗ Not found: $script"
    fi
done

echo "Done."