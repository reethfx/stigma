<div align="center"><img src="https://images.fineartamerica.com/images/artworkimages/medium/3/berserk-logo-anime-art-anime-art-transparent.png" width="250" height="300"</img></div>
<h1 align="center">Stigma - ベルセルク</h1>

Thank you for visiting and exploring my world of aesthetics and beauty based on the famous dark fantasy world. May your creative journey be as splendid as the eclipe from which "Stigma" takes its name.


<div align="center">

![nixos](https://img.shields.io/badge/NixOS-24273A.svg?style=flat&logo=nixos&logoColor=CAD3F5)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8aadf4)
![linux kernel](https://img.shields.io/badge/kernel-zen-informational.svg?style=flat&logo=linux&logoColor=f4dbd6&colorA=24273A&colorB=b7bdf8)
![hyprland](https://img.shields.io/badge/hyprland-stable-informational.svg?style=flat&logo=wayland&logoColor=eed49f&colorA=24273A&colorB=91d7e3)
![rust](https://img.shields.io/badge/rust-nightly-informational.svg?style=flat&logo=rust&logoColor=f5a97f&colorA=24273A&colorB=f5a97f)

</div>

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

## 🚀 Installation

1. Download and Install NixOS from the [official site](https://nixos.org/download).
2. Temporarily install ripgrep and fish using the command: `nix-shell -p ripgrep fish --run fish`. You can also use classic bash and grep for the next step without installing fish and ripgrep.
3. Run the command `rg --hidden FIXME` and change/add lines to match your device, swaps, partitions, peripherals, file systems, etc. in the configuration files. 

   🚨 Ensure that you configure USBGuard in the `nixos/usb.nix` file to avoid potential issues. By default, USBGuard blocks all USB devices, which can lead to the disabling of crucial hardware components such as the integrated camera, bluetooth, wifi, etc. To configure USBGuard properly, add your trusted USB devices to the configuration. You can obtain a list of all connected devices by using the `lsusb` command from the `usbutils` package.

    Failure to configure USBGuard appropriately may result in the inability to connect any USB devices to your machine. If needed, you can also disable USBGuard altogether by setting `services.usbguard.enable` to `false` in the configuration:`services.usbguard.enable = false;`. This step ensures that USBGuard is not actively blocking any USB devices.

   🚨 Also, important: If you use disk encryption with LUKS and want to use encrypted swap, you need to enable swap on LUKS. This is usually auto-generated in `/etc/nixos/configuration.nix` as the `boot.initrd.luks.devices."luks-...".device = "/dev/disk/by-uuid/...";` code block, if you set this option up during the NixOS installation process. You can simply copy this snippet to either `nixos/swap.nix`, `nixos/hardware-configuration.nix`, or `nixos/configuration.nix` (Personally, I prefer to copy it to `hardware-configuration.nix`).

   Alternatively, you can set it up manually or use [swap encryption with a random key](https://nixos.wiki/wiki/Swap#Encrypt_swap_with_random_key).

4. To change the default username and/or hostname, run the command `rg --hidden 'xnm'` to find and fix all instances of the username, and `rg --hidden 'isitreal-laptop'` for the hostname. 🚨 Make sure to change the username to match yours set during installation to avoid login issues. 🚨 Also, don't forget to delete or change to yours the git settings in `home/.gitconfig`, `home/projects/.gitconfig.personal`, and `home/work/.gitconfig.work` files, as they are configured for my personal use.
5. Enable `flake` support (more [here](https://nixos.wiki/wiki/Flakes#Enable_flakes_temporarily)) on your current system. Don't forget to run `sudo nixos-rebuild switch` after enabling `flake` in your `/etc/configuration.nix`.
6. Copy or move all files (with replacements) from the `home` directory to your `$HOME` directory in Linux.
7. Copy or move all files (with replacements and **sudo** permissions) from the `nixos` directory to `/etc/nixos/`. 🚨 Ensure that `system.stateVersion = "your_version";` is correctly set to the release version of the initial installation of your system in the `configuration.nix` file. 🚨 Also, for security reasons, ensure all files in the `/etc/nixos` directory are owned by **root**. If not, change ownership using the command: `sudo chown -R root:root /etc/nixos`.
8. Run the command `sudo nixos-rebuild switch --flake /etc/nixos#your-hostname` or `nswitchu`. If you chose first command, replace `your-hostname` with your hostname before running the command; by default, hostname is set to `isitreal-laptop`.
9. Post-installation configuration:

 - Import GNOME settings along with the theme by executing the following command: `dconf load / < home/.config/gnome_settings_backup.dconf`. Additionally, you can use tools like **gnome-tweaks** or **themechanger** to fine-tune specific theme preferences to your liking.

 - Install dictionaries for spellchecking in Qutebrowser by using the similar command in **bash**: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) install en-US hi-IN`.
  To obtain a list of all available dictionaries, run: `$(find $(nix-store --query --outputs $(which qutebrowser)) -iname '*dictcli.py*' | head -1) list` in **bash**. 
  For more information, visit [the Qutebrowser page on the nixos wiki](https://wiki.nixos.org/wiki/Qutebrowser).

 - Apply Catppuccin theme for websites in your browser (Brave, Firefox, Chromium):
   - Install the Stylus Extension from its [official website](https://add0n.com/stylus.html).
   - Open the extension's settings page and navigate to the Backup section.
   - Click "Import" and select the file `home/.config/stylus-catppuccin.json`.

 - Apply Catppuccin theme for Cool-Retro-Term:
   - Launch Cool-Retro-Term.
   - Right-click on the window and select "Settings".
   - In the General panel, click "Import" and select the file `home/.config/cool-retro-term-style.json`.
   - Select the imported profile named "new-catppuccin-theme".
   - Click "Load" and exit from "Settings".

  - Login to your accounts.

  - Customize graphical applications to suit your preferences.

  After this, you will have a complete system.

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
