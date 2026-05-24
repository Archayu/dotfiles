#!/bin/bash
# ╭─────────────── ✦ ────────────────╮
#│    WALLPAPER SELECTOR SCRIPT        │
# ╰─────────────── ✦ ────────────────╯
#
# Author    : archayu
# GitHub    : https://github.com/archayu/dotfiles
# Script    : Fast wallpaper selector with thumbnails
# Requires  : rofi, awww, imagemagick, hyprland, matugen


wall_dir="${HOME}/.config/walls"
cache_dir="${HOME}/.cache/walls"
rofi_config="${HOME}/.config/rofi/wallpaper/wall.rasi"
current_wall="${cache_dir}/.current_wallpaper"

mkdir -p "$cache_dir"

# awww animation settings
TRANSITION_TYPE="grow"
TRANSITION_POS="0.5,0.5"
TRANSITION_STEP="255"
TRANSITION_FPS="60"
TRANSITION_DURATION="1.5"

# ─────────────────────────────────────────
# Get current wallpaper path
# ─────────────────────────────────────────
get_current_wall() {
    if [ -f "$current_wall" ]; then
        cat "$current_wall"
    fi
}

# ─────────────────────────────────────────
# Open a floating terminal running matugen
# interactively — matugen shows its own
# color picker, user selects, done.
# ─────────────────────────────────────────
generate_colors() {
    local wall="$1"

    # ── Detect available terminal emulator ───────────────────────────────
    local term=""
    for t in foot kitty alacritty wezterm ghostty; do
        if command -v "$t" &>/dev/null; then
            term="$t"
            break
        fi
    done

    if [ -z "$term" ]; then
        notify-send "Matugen" "⚠ No terminal emulator found (tried: foot kitty alacritty wezterm ghostty)" -t 4000
        return 1
    fi

    # Kill any existing matugen picker that's still open
    pkill -f "matugen image" 2>/dev/null
    sleep 0.2

    notify-send "Matugen" "Select accent color in the terminal popup" -t 2000

    # Small delay to ensure any previous rofi/wayland compositor focus is released
    sleep 0.5

    # ── Launch terminal with matugen ─────────────────────────────────────
    # Each terminal is run synchronously (blocks until matugen finishes).
    # Hyprland window rules can make these float — see note at bottom.
    case "$term" in
        foot)
            foot --title "matugen-picker" -- matugen image "$wall"
            ;;
        kitty)
            kitty --title "matugen-picker" -- matugen image "$wall"
            ;;
        alacritty)
            alacritty --title "matugen-picker" -e matugen image "$wall"
            ;;
        wezterm)
            wezterm start --always-new-process -- matugen image "$wall"
            ;;
        ghostty)
            ghostty --title="matugen-picker" -e "matugen image \"$wall\""
            ;;
    esac
}

# ─────────────────────────────────────────
# Set wallpaper and trigger color picker
# ─────────────────────────────────────────
set_wallpaper() {
    local wall="$1"
    awww img "$wall" \
        --transition-type "$TRANSITION_TYPE" \
        --transition-pos "$TRANSITION_POS" \
        --transition-step "$TRANSITION_STEP" \
        --transition-fps "$TRANSITION_FPS" \
        --transition-duration "$TRANSITION_DURATION"
    echo "$wall" > "$current_wall"

    generate_colors "$wall"
}

# ─────────────────────────────────────────
# Get all wallpapers as array
# ─────────────────────────────────────────
get_wallpapers() {
    find "$wall_dir" -maxdepth 1 -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | sort
}

# ─────────────────────────────────────────
# Next wallpaper
# ─────────────────────────────────────────
next_wallpaper() {
    local current=$(get_current_wall)
    local walls=($(get_wallpapers))
    local total=${#walls[@]}

    if [ -z "$current" ]; then
        set_wallpaper "${walls[0]}"
        return
    fi

    for i in "${!walls[@]}"; do
        if [ "${walls[$i]}" == "$current" ]; then
            local next_idx=$(( (i + 1) % total ))
            set_wallpaper "${walls[$next_idx]}"
            notify-send "Wallpaper" "Next: $(basename "${walls[$next_idx]}")" -t 2000
            return
        fi
    done

    set_wallpaper "${walls[0]}"
}

# ─────────────────────────────────────────
# Previous wallpaper
# ─────────────────────────────────────────
prev_wallpaper() {
    local current=$(get_current_wall)
    local walls=($(get_wallpapers))
    local total=${#walls[@]}

    if [ -z "$current" ]; then
        set_wallpaper "${walls[-1]}"
        return
    fi

    for i in "${!walls[@]}"; do
        if [ "${walls[$i]}" == "$current" ]; then
            local prev_idx=$(( (i - 1 + total) % total ))
            set_wallpaper "${walls[$prev_idx]}"
            notify-send "Wallpaper" "Previous: $(basename "${walls[$prev_idx]}")" -t 2000
            return
        fi
    done

    set_wallpaper "${walls[-1]}"
}

# ─────────────────────────────────────────
# Random wallpaper
# ─────────────────────────────────────────
random_wallpaper() {
    local walls=($(get_wallpapers))
    local total=${#walls[@]}
    local random_idx=$((RANDOM % total))
    set_wallpaper "${walls[$random_idx]}"
    notify-send "Wallpaper" "Random: $(basename "${walls[$random_idx]}")" -t 2000
}

# ─────────────────────────────────────────
# Show help
# ─────────────────────────────────────────
show_help() {
    cat << EOF
Enhanced Wallpaper Manager

Usage: $(basename "$0") [OPTION]

Options:
    -n, --next      Switch to next wallpaper
    -p, --prev      Switch to previous wallpaper
    -r, --random    Set random wallpaper
    -h, --help      Show this help message
    (no option)     Open wallpaper selector GUI

After every wallpaper change, a terminal popup opens running
matugen. Use arrow keys to pick your accent color, press Enter,
and the theme is applied.

To make the terminal float in Hyprland, add to hyprland.conf:
    windowrulev2 = float, title:^(matugen-picker)$
    windowrulev2 = size 550 220, title:^(matugen-picker)$
    windowrulev2 = center, title:^(matugen-picker)$

Examples:
    $(basename "$0")           # Open GUI selector
    $(basename "$0") -n        # Next wallpaper
    $(basename "$0") -p        # Previous wallpaper
    $(basename "$0") -r        # Random wallpaper
EOF
}

# ─────────────────────────────────────────
# Parse arguments
# ─────────────────────────────────────────
case "$1" in
    -n|--next)
        next_wallpaper
        exit 0
        ;;
    -p|--prev)
        prev_wallpaper
        exit 0
        ;;
    -r|--random)
        random_wallpaper
        exit 0
        ;;
    -h|--help)
        show_help
        exit 0
        ;;
    "")
        # Continue to GUI selector below
        ;;
    *)
        echo "Unknown option: $1"
        show_help
        exit 1
        ;;
esac

# ─────────────────────────────────────────
# GUI: Generate thumbnails in parallel
# (only for new/modified images)
# ─────────────────────────────────────────
find "$wall_dir" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | \
xargs -P$(nproc) -I{} sh -c '
    img="{}"; thumb="'"$cache_dir"'/$(basename "$img")"
    [ -f "$thumb" ] && [ "$thumb" -nt "$img" ] && exit
    magick "$img" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "$thumb" 2>/dev/null
' &

# Get icon size (without jq dependency)
res=$(hyprctl monitors | grep -A2 "^Monitor" | grep -oP '\d+x\d+' | head -1 | cut -dx -f1)
res=${res:-1920}
icon_size=200

# ─────────────────────────────────────────
# Launch rofi wallpaper selector
# ─────────────────────────────────────────
selection=$(find "$wall_dir" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) \
    -exec basename {} \; | sort | while read -r fname; do
        echo -en "${fname}\x00icon\x1f${cache_dir}/${fname}\n"
    done | rofi -dmenu \
        -theme "$rofi_config" \
        -theme-str "element-icon{size:${icon_size}px;border-radius:8px;}" \
        -p " ")

# Wait for rofi to fully release focus before opening terminal
if [ -n "$selection" ]; then
    sleep 0.3
    set_wallpaper "${wall_dir}/${selection}"
fi