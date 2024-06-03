# Stigma - ベルセルク
<p align="center">
<img src="https://images.fineartamerica.com/images/artworkimages/medium/3/berserk-logo-anime-art-anime-art-transparent.png" width="250" height="300" style=flexbox> 
</p>
<br>
Greetings and welcome to "Stigma (ベルセルク)"

Thank you for visiting and exploring my world of aesthetics and beauty based on the famous dark fantasy world. May your creative journey be as splendid as the eclipe from which "Stigma" takes its name.

## Table of Contents
- [About](#-about)
- [Showcase](#-showcase)
- [Components](#-components)
- [Features](#-features)
- [Installation](#-installation)
- [Keybindings](#️-keybindings)
- [Useful aliases in Fish Shell](#-useful-aliases-in-fish-shell)

## 📖 About

This repository houses my NixOS Linux ❄️ flake configuration, featuring the Hyprland window manager and adorned with the stylish Catppuccin Macchiato theme. I rely on this setup as my daily driver for work and programming, primarily in Rust 🦀. Feel free to utilize it in its entirety or borrow specific components for your own configuration.

🚨 It's essential to note that this configuration is not minimalistic or lightweight and may require some disk space and knowledge to understand. If you're looking for something simpler, this configuration may not be suitable for you.

This system leverages cutting-edge channels and versions of software to provide you with the latest updates and features. Notably, it utilizes:

- **flake** (An experimental feature of the Nix package manager)
- ~~**nur** (The Nix User Repository)~~ *currently disabled
- **nixpkgs**: unstable
- **rust**: nightly version

This approach ensures that you stay on the forefront of technology, receiving the most recent software advancements promptly. 🚨 However, it's important to note that this emphasis on bleeding-edge software may impact the stability of the system.

🚨 Please note that the system utilizes **Podman** instead of **Docker** for containerization due to various reasons, primarily related to security (rootless and daemonless containers), easier migration to Kubernetes, availability of pods, compatibility with systemd, and better security for `distrobox`. If you prefer to use **Docker** instead of **Podman**, you can make the switch by commenting out the **Podman** section in the `nixos/virtualisation.nix` file and uncommenting the **Docker** section. More details on **Docker** configuration in NixOS can be found [here](https://nixos.wiki/wiki/Docker).

The system also enables SELinux patches, as well as AppArmor and Tomoyo Linux Security Modules. It includes security daemons such as Fail2Ban and USBGuard, with Firejail preinstalled to meet your security requirements.

You have the flexibility to customize these configurations according to your needs by modifying the respective configuration files.

## 🔧 Components

| Component             | Version/Name                |
|-----------------------|-----------------------------|
| Distro                | NixOS                       |
| Kernel                | Zen                         |
| Shell                 | Fish                        |
| Display Server        | Wayland                     |
| WM (Compositor)       | Hyprland                    |
| Bar                   | Waybar                      |
| Notification          | Dunst                       |
| Launcher              | Rofi-Wayland                |
| Editor                | Helix                       |
| Terminal              | WezTerm + Starship          |
| OSD                   | Avizo                       |
| Night Gamma           | Gammastep                   |
| Fetch Utility         | Neofetch                    |
| Theme                 | Catppuccin Macchiato        |
| Icons                 | Colloid-teal-dark, Numix-Circle |
| Font                  | JetBrains Mono + Nerd Font Patch |
| Player                | Youtube Music + Spotify     |
| File Browser          | Thunar                      |
| Internet Browser      | Qutebrowser, Brave + Vimium + NightTab + Stylus |
| Mimetypes             | MPV, Imv, Zathura            |
| Image Editor          | Swappy                      |
| Screenshot            | Grim + Slurp                |
| Recorder              | Wl-screenrec                 |
| Color Picker          | Hyprpicker                  |
| Clipboard             | Wl-clipboard + Cliphist + Wl-clip-persist    |
| Idle                  | Hypridle                    |
| Lock                  | Hyprlock                    |
| Logout menu           | Wlogout                     |
| Wallpaper             | Hyprpaper                   |
| Graphical Boot        | Plymouth + Catppuccin-plymouth |
| Display Manager       | Greetd + Tuigreet           |
| Containerization      | Podman                      |

## ⌨️ Keybindings

### Main

| Key Combination        | Action                       |
|------------------------|------------------------------|
| ALT + R                | Resize windows mode          |
| ALT + M                | Move windows mode            |
| SUPER + H, J, K, L     | Change window focus          |
| SUPER + 1..0           | Change workspace             |
| SUPER + SHIFT + 1..0   | Move window to workspace     |
| SUPER + SHIFT + Q      | Kill active window           |
| SUPER + SHIFT + F      | Toggle floating window       |
| SUPER + CTRL + F       | Toggle full-screen           |
| SUPER + SHIFT + O      | Toggle split                 |
| SUPER + SHIFT + P      | Toggle pseudo                |
| SUPER + SHIFT + M      | Exit from `hyprland`         |
| SUPER + CTRL + E       | Expose all windows using `pyprland` |
| SUPER + CTRL + M       | Expose all minimized windows using `pyprland` |
| SUPER + M              | Minimize or restore a window using `pyprland` |
| SUPER + CTRL + T       | Launch scratchpad with `wezterm` using `pyprland` |
| SUPER + CTRL + V       | Launch scratchpad with `pavucontrol` using `pyprland` |
| SUPER + T              | Launch `wezterm`             |
| SUPER + D              | Launch `rofi -drun`          |
| SUPER + B              | Launch `qutebrowser`         |
| SUPER + SHIFT + B      | Launch `brave`               |
| SUPER + F              | Launch `thunar`              |
| SUPER + ESCAPE         | Launch `wlogout`             |
| SUPER + S              | Launch `spotify`             |
| SUPER + Y              | Launch `youtube-music`       |
| SUPER + SHIFT + D      | Launch `discord`             |
| SUPER + SHIFT + T      | Launch `telegram`            |
| SUPER + SHIFT + L      | Launch `hyprlock`            |
| SUPER + SHIFT + S      | Take screenshot              |
| SUPER + E              | Launch `swappy` to edit last taken screenshot |
| SUPER + R              | Record screen area (MP4)     |
| SUPER + SHIFT + R      | Record screen area (GIF)     |
| SUPER + C              | Launch color picker (using `hyperpicer`) |
| SUPER + Z              | Toggle Zoom (with `pyprland`)|
| SUPER + V              | Launch clipboard menu (`rofi -dmenu`) |
| SUPER + SHIFT + V      | Launch clipboard menu (`rofi -dmenu`) (copy to clipboard) |
| SUPER + X              | Launch clipboard deletion item menu (`rofi -dmenu`) |
| SUPER + SHIFT + X      | Clear clipboard             |
| SUPER + U              | Launch bookmark menu (`rofi -dmenu`) |
| SUPER + SHIFT + U      | Add text from clipboard to bookmark |
| SUPER + CTRL + U       | Launch bookmark deletion item menu (`rofi -dmenu`) |
| SUPER + SHIFT + A      | Toggle airplane mode        |
| SUPER + SHIFT + N      | Toggle notifications        |
| SUPER + SHIFT + Y      | Toggle bluetooth            |
| SUPER + SHIFT + W      | Toggle wifi                 |
| SUPER + P              | Toggle play-pause player    |
| SUPER + ]              | Player next track           |
| SUPER + [              | Player previous track       |

You can find all other keybindings in `/home/.config/hypr/hyprland.conf` in the bind section. All system fish scripts are located at `/home/.config/fish/functions` directory.

## 💻 Gallery

## 💻 Inspiration
Direct inspiration taken from [XNM1](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles?tab=readme-ov-file#-installation)
