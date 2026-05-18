# 🌸 Hyprland Rice - Archayu's Dotfiles

Welcome to my beautifully customized Hyprland desktop environment! This is a meticulously crafted Linux rice featuring a modern, cohesive workflow built around the **Hyprland** dynamic tiling compositor with the **Catppuccin Mocha** color scheme.

> **A minimalist aesthetic meets powerful functionality** — Smooth animations, seamless color theming, and intuitive keybindings create a desktop experience that's both beautiful and productive.

---

## 🎨 Visual Overview

**Theme:** Catppuccin Mocha  
**Color Accent:** Red (with vibrant complements)  
**Terminal:** Kitty  
**Terminal Font & Colors:** Catppuccin Mocha with custom opacity  
**Bar/Panel:** QuickShell (custom QML-based bar)  
**Launcher:** Rofi with Papirus icons  
**System Font Detection:** Fastfetch with custom ASCII art  

---

## 📦 What's Inside

### **Core Components**

| Component | Purpose | Config Location |
|-----------|---------|-----------------|
| **Hyprland** | Dynamic tiling compositor | `.config/hypr/` |
| **Kitty** | GPU-based terminal emulator | `.config/kitty/kitty.conf` |
| **Rofi** | Application launcher & window switcher | `.config/rofi/` |
| **QuickShell** | Status bar, notifications, clipboard | `.config/quickshell/` |
| **Matugen** | Dynamic color generation from wallpapers | `.config/matugen/` |

### **Configuration Structure**

```
~/.config/dotfiles/
├── hypr/                          # Hyprland configurations
│   ├── hyprland.conf              # Main config file
│   ├── keybinds.conf              # Keyboard shortcuts
│   ├── autostart.conf             # Auto-launch applications
│   ├── decoration.conf            # Animations & visual effects
│   ├── windowrules.conf           # Window-specific rules
│   └── Palette/
│       └── mocha.conf             # Catppuccin Mocha colors
├── kitty/
│   └── kitty.conf                 # Terminal emulator settings
├── rofi/                          # Application launcher
│   ├── config.rasi                # Rofi configuration
│   ├── launchers/
│   │   └── launcher.sh            # Launcher script
│   └── wallpaper/                 # Wallpaper manager
├── quickshell/                    # Status bar & utilities
│   ├── bar/                       # Bar modules
│   ├── notifications/             # Notification daemon
│   ├── scripts/                   # Utility scripts
│   └── theme/                     # Theme files
├── matugen/                       # Color theme generator
│   ├── config.toml                # Template definitions
│   └── templates/                 # Theme templates
├── fastfetch/                     # System info display
│   ├── config.jsonc               # FastFetch config
│   └── ascii.txt                  # Custom ASCII art
├── vesktop/                       # Discord with themes
├── wlogout/                       # Logout menu
└── walls/                         # Wallpaper storage
```

---

## 🎯 Key Features

### ✨ **Hyprland Compositor**
- **Dynamic Tiling:** Intelligent window management with smooth workspace transitions
- **GPU Acceleration:** Hardware-accelerated rendering for efficiency
- **Smooth Animations:** Custom Bezier curves for window interactions (wind, winOut, bounce effects)
- **Workspace Navigation:** Multiple workspaces with seamless switching
- **Floating Window Support:** Mix tiling and floating windows intuitively

### 🎨 **Unified Color Theming**
- **Matugen Integration:** Auto-generates color palettes from wallpapers
- **System-wide Syncing:** Colors apply to:
  - Kitty terminal
  - Rofi launcher
  - Discord (via Vesktop)
  - Firefox (via Pywalfox)
  - GTK applications (GTK3/GTK4)
  - Qt applications (Qt5ct/Qt6ct)
  - Icon colors (Papirus icons)
  - Wlogout menu

### ⌨️ **Intuitive Keybindings**
- **Super (Windows Key) + [Q/W/E/A/T/B/C/L]** for common actions
- **Window Management:** Arrow keys for focus/resize/move
- **Media Control:** Function keys for volume, brightness, media playback
- **Quick Launch:** Rofi, terminal, file manager, browser shortcuts
- **Utility:** Screenshot, color picker, clipboard manager

### 💾 **Persistent Wallpaper & Color State**
- Wallpapers stored in `~/.config/rofi/wallpaper/`
- Color cache in `~/.cache/wal/colors.json`
- Icon colors dynamically updated via Papirus theme

---

## ⌨️ Essential Keybindings

### Window Management
```
Super + Q           → Kill active window
Alt + F4            → Kill active window (alternative)
Super + W           → Toggle floating window
Super + L           → Lock screen (swaylock)
Alt_R + Ctrl_R      → Toggle waybar
Shift + F11         → Fullscreen
Super + Shift + F   → Pin window
```

### Focus & Navigation
```
Super + ↑↓←→        → Move focus up/down/left/right
Alt + Tab           → Cycle to next window
```

### Resize & Move Windows
```
Super + Shift + ↑↓←→   → Resize active window
Super + Shift + Ctrl + ↑↓←→ → Move window to adjacent workspace
Super + Z            → Move window (keyboard mode)
Super + X            → Resize window (keyboard mode)
Super + Mouse1       → Move window (with mouse)
Super + Mouse2       → Resize window (with mouse)
```

### Layout & Split
```
Super + J           → Toggle split layout
Super + S           → Toggle special (scratchpad) workspace
Super + Shift + S   → Move window to scratchpad
Super + Alt + S     → Move window to scratchpad (silent)
```

### Applications & Launchers
```
Super + T           → Open Terminal (Kitty)
Super + A           → Open Application Launcher (Rofi)
Super + E           → Open File Manager (Nautilus)
Super + C           → Open Editor (VSCode)
Super + B           → Open Browser (Firefox)
Super + V           → Clipboard Manager (QuickShell)
Super + Shift + C   → Color Picker (Hyprpicker)
Ctrl + Shift + Esc  → Open System Monitor (htop)
```

### Audio Controls
```
F10, XF86AudioMute              → Toggle mute
F11, XF86AudioLowerVolume       → Decrease volume (5%)
F12, XF86AudioRaiseVolume       → Increase volume (5%)
XF86AudioNext                   → Next track
XF86AudioPrev                   → Previous track
XF86AudioPlay/Pause             → Play/Pause media
```

### Brightness Control
```
XF86MonBrightnessUp             → Increase brightness (10%)
XF86MonBrightnessDown           → Decrease brightness (10%)
```

### Wallpaper & Theming
```
Super + P                       → Screenshot menu
Super + Shift + W               → Wallpaper selection menu
Super + Shift + Right           → Next wallpaper
Super + Shift + Left            → Previous wallpaper
Super + Shift + R               → Random wallpaper
```

### Workspaces
```
Super + 1-9, 0                 → Switch to workspace 1-10
Super + Ctrl + Right            → Switch to next workspace
Super + Ctrl + Left             → Switch to previous workspace
Super + Ctrl + Down             → Switch to empty workspace
Super + Shift + 1-9, 0          → Move window to workspace 1-10
Super + Shift + Ctrl + Alt + Right → Move window to next workspace
Super + Shift + Ctrl + Alt + Left  → Move window to previous workspace
```

### System
```
Super + Delete      → Exit Hyprland
```

---

## 🔧 Dependencies

### **Core System Requirements**
- Linux kernel with Wayland support
- systemd (for user services)

### **Display Server & Compositor**
| Package | Purpose |
|---------|---------|
| `hyprland` | Main display compositor |
| `wl-clipboard` | Wayland clipboard support |
| `cliphist` | Clipboard history |

### **Terminal & Shell**
| Package | Purpose |
|---------|---------|
| `kitty` | GPU-accelerated terminal |
| `zsh` | Shell (or bash) |

### **Launchers & Menus**
| Package | Purpose |
|---------|---------|
| `rofi` | Application launcher |
| `wlogout` | Session logout menu |

### **Bars & Panels**
| Package | Purpose |
|---------|---------|
| `quickshell` | QML-based status bar & notifications |
| `waybar` | Alternative lightweight bar |

### **Wallpaper & Color Management**
| Package | Purpose |
|---------|---------|
| `swww` | Animated wallpaper daemon |
| `matugen` | Generate color schemes from wallpapers |
| `pywalfox` | Sync colors to Firefox |
| `hyprpicker` | Color picker tool |

### **Theme & Icons**
| Package | Purpose |
|---------|---------|
| `papirus-icon-theme` | Icon theme (used in Rofi & apps) |
| `gtk-3.0` / `gtk-4.0` | GTK theme support |
| `qt5ct` / `qt6ct` | Qt application theming |
| `adw-gtk3` | Modern GTK3 theme |

### **Audio Control**
| Package | Purpose |
|---------|---------|
| `pipewire` / `pulseaudio` | Audio server |
| `pactl` | PulseAudio control (included with pulseaudio) |
| `playerctl` | Media player control |

### **Brightness Control**
| Package | Purpose |
|---------|---------|
| `brightnessctl` | Brightness adjustment |

### **Security & Utilities**
| Package | Purpose |
|---------|---------|
| `swaylock` | Wayland lock screen |
| `network-manager-applet` | Network management icon |

### **Applications** (referenced in keybinds)
| Package | Purpose |
|---------|---------|
| `firefox` | Web browser |
| `vesktop` | Discord with custom themes |
| `nautilus` / `thunar` | File manager |
| `code` / `vim` | Text editor |
| `fastfetch` | System information display |

### **Font Support** (optional but recommended)
```
ttf-jetbrains-mono              # Clean monospace font
ttf-fira-code                   # Code font with ligatures
ttf-font-awesome                # Icon fonts
```

---

## 📥 Installation

### 1. **Install Dependencies**

**For Arch Linux/Manjaro:**
```bash
sudo pacman -S hyprland kitty rofi wlogout swww matugen pywalfox \
  papirus-icon-theme gtk-3.0 gtk-4.0 qt5ct qt6ct adw-gtk3 \
  brightnessctl playerctl network-manager-applet swaylock \
  wl-clipboard cliphist firefox fastfetch quickshell
  ```

**For Fedora:**
```bash
sudo dnf install hyprland kitty rofi wlogout swww matugen pywalfox \
  papirus-icon-theme gtk3 gtk4 qt5ct qt6ct adw-gtk3-theme \
  brightnessctl playerctl network-manager-applet swaylock \
  wl-clipboard cliphist firefox fastfetch
```

**For Ubuntu/Debian:**
```bash
sudo apt install hyprland kitty rofi wlogout swww brightnessctl \
  playerctl network-manager-applet swaylock wl-clipboard firefox fastfetch
```
*(Note: Some packages like matugen may need to be installed from source or via Rust/Python packages)*

### 2. **Install QuickShell** (from source)
```bash
git clone https://github.com/quickshell/quickshell.git
cd quickshell
mkdir build && cd build
cmake ..
make
sudo make install
```

### 3. **Clone Dotfiles**
```bash
git clone https://github.com/archayu/dotfiles.git 
cd dotfiles
```
- Move all the files in respective folders 
- After that run the script `make-executable.sh` to make all the scripts run

### 4. **Set Permissions**
The included `make-executable.sh` script sets execute permissions on:
- Rofi launcher script
- QuickShell clipboard utility
- Wallpaper manager
- Icon customization script
- Screenshot script

### 5. **Configure Cursors**
Install Catppuccin cursor theme:
```bash
# Arch
sudo pacman -S catppuccin-cursors

# Or manual installation
git clone https://github.com/catppuccin/cursors.git
cd cursors && mkdir -p ~/.local/share/icons
cp -r Catppuccin-Mocha-Red ~/.local/share/icons/
```


---

## 🚀 Usage & Customization

### **Launch with Custom Theme**
Edit wallpaper color source:
```bash
matugen -i /path/to/wallpaper.jpg
```
This regenerates all color templates and applies changes system-wide.

### **Modify Hyprland Keybinds**
Edit `~/.config/hypr/keybinds.conf` and modify `$mainMod` for different modifier key:
```bash
$mainMod = ALT  # Change from SUPER to ALT
```

### **Change Terminal Font/Size**
Edit `~/.config/kitty/kitty.conf`:
```bash
font_family      JetBrains Mono
font_size        12
```

### **Customize Bar Modules**
Edit `~/.config/quickshell/bar/TopBar.qml` to add/remove status indicators.

### **Add Window Rules**
Add application-specific behaviors in `~/.config/hypr/windowrules.conf`:
```bash
windowrule = match:class ^(spotify)$, float on
windowrule = match:class ^(steam)$, workspace 9
```

---

## 📝 File Descriptions

| File | Purpose |
|------|---------|
| `hyprland.conf` | Main Hyprland configuration (monitors, env vars) |
| `keybinds.conf` | Keyboard shortcuts and window controls |
| `autostart.conf` | Programs to launch on startup |
| `decoration.conf` | Animations, shadows, blur effects |
| `windowrules.conf` | Per-window opacity, sizing, positioning rules |
| `mocha.conf` | Catppuccin Mocha color palette variables |
| `kitty.conf` | Terminal font, colors, and behavior |
| `rofi/config.rasi` | Launcher appearance and behavior |
| `matugen/config.toml` | Color template definitions & hooks |
| `make-executable.sh` | Script permissions setup |

---

## 🐛 Troubleshooting

### **Screen going black after login**
- Ensure `swww-daemon` starts properly
- Check `~/.cache/wal/colors.json` exists
- Verify QuickShell is installed: `which quickshell`

### **Rofi not launching**
```bash
# Check if executable
ls -la ~/.config/rofi/launchers/launcher.sh
chmod +x ~/.config/rofi/launchers/launcher.sh
```

### **Colors not syncing**
```bash
# Regenerate color theme
matugen -i ~/.config/rofi/wallpaper/current.png
```

### **Audio controls not working**
```bash
# Check PulseAudio/PipeWire status
pactl info  # For PulseAudio
pw-cli info | head  # For PipeWire
```

### **Brightness not responding**
```bash
# Check if brightnessctl is installed
brightnessctl set 50%

# List available devices
brightnessctl list
```

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center">
      <img src="https://cdn.imgtree.co/images/edRikHSz.png" width="400"><br>
      <b>Desktop Overview</b>
    </td>
    <td align="center">
      <img src="https://cdn.imgtree.co/images/GUmxI1BJ.png" width="400"><br>
      <b>Terminal</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://cdn.imgtree.co/images/-sC43Hsk.png" width="400"><br>
      <b>Browser</b>
    </td>
    <td align="center">
      <img src="https://cdn.imgtree.co/images/f04MmKHD.png" width="400"><br>
      <b>Wallpaper Menu</b>
    </td>
  </tr>
</table>

---

## 🎁 Credits & Inspiration

- **Hyprland**: [Hyprland GitHub](https://github.com/hyprwm/Hyprland)
- **Catppuccin**: [Catppuccin GitHub](https://github.com/catppuccin)
- **Matugen**: Material You inspired theme generator
- **QuickShell**: Modern QML-based panel framework
- **Papirus Icons**: Modern icon theme

---

## 💡 Tips & Tricks

1. **Fast Terminal Opening:** Use `Super + T` to spawn a new Kitty window instantly
2. **Color Picker:** `Super + Shift + C` to sample any color and copy hex code
3. **Window Stacking:** Use `Super + J` to toggle between tiling and tabbed layouts
4. **Screenshot Workflow:** Bind screenshot tools to dedicated hotkeys in keybinds
5. **Multi-Monitor:** Duplicate `monitor=` line in hyprland.conf for each display
6. **Battery Saver:** Reduce animation complexity by editing bezier curves in decoration.conf

---

## 📞 Contact & Repository

- **GitHub**: [archayu/dotfiles](https://github.com/archayu/dotfiles)
- **Discord**: [@Archayu](https://discordapp.com/users/1051806381461745664)
- **Author**: archayu

Feel free to fork, customize, and share your own variations! 🌟

---

**Last Updated:** 18 May 2026  
**Hyprland Version:** 0.54.2
