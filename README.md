# My Linux Desktop Dotfiles

![Screenshot Neofetch/Spotify](./screenshots/spotify.png)

My collection of dotfiles with Herbstluftwm window manager and Neovim config, as well as multiple other small files. I have used this configuration actively on Arch Linux and Linux Mint (Ubuntu), both on X11. For these Operating Systems, the chezmoi config can also automatically install required packages.

> [!IMPORTANT]
> To use the herbstluftwm and/or eww config, supporting software is needed. See _Installation_ for more information.

## Installation

### Usage with Chezmoi

1. Install [chezmoi](https://www.chezmoi.io/):
2. Apply dotfiles:

```bash
chezmoi init https://github.com/fzahner/dotfiles.git
chezmoi apply -v
```

> [!IMPORTANT]
> When installing on debian, some packages cannot be installed with apt. See the `debian.manual` section in `.chezmoidata/packages.yaml` for packages which have to be installed manually.

### Manual installation

1. Clone this repo
2. Copy desired files to from `dot-config/` to `~/.config/`
3. Find all files starting with `executable_`, remove the `executable_` part of the filename and ensure the file has execution permissions set
4. Install packages and apply commands found in `.chezmoidata/packages.yaml`

### Troubleshooting

If any part of herbstluftwm or eww are not working correctly, double check file permissions to ensure all files which need to be executed have correct permissions. To find all files which should be marked as executable, use:

```sh
chezmoi cd
find . -name "*.sh"
# Also search for files without any endings like herbstluftwm/autostart
find .  -not -name "*.*" -type f

# Check file permissions
ls -la
# Set file permissions
sudo chmod +x exampleFile.sh
```

## Features

- Productivity focused setup for school and work
- Lightweight and performant desktop environement
- [Everforest](https://github.com/sainnhe/everforest)/[Gruvbox Material](https://github.com/sainnhe/gruvbox-material) based colors (green and dark) have been used throughout: In window manager, widgets, neovim, superfile file explorer, spotify, ...

### Desktop Environment

![Screenshot Powermenu](./screenshots/powermenu.png)

- Herbstluftwm tiling window manager with custom layouts
- Eww widgets for bar with tag and system resources overviews
- Rofi Application Launcher with SSH and window functionality

![Screenshot Rofi](./screenshots/rofi.png)

### Neovim IDE

![Screenshot Neovim](./screenshots/nvim.png)

- Out-of-the-box functionality for many languages: Python, JS/TS, Go, HTML/CSS, Lua, Tex, Rust, ...
- Lazy-Loaded Plugins to ensure quick startup times

### Other notable Programs

- **Terminal:**
  - Alacritty & Kitty configurations
  - Fish shell configuration
  - Custom `clone-term` command to open one or multiple terminals at the same directory location
- **File Manager:** Superfile with custom vim-based keybinds and gruvbox colorscheme.

## More Screenshots

![Screenshot File Manager](./screenshots/filemanager.png)

![Screenshot Web](./screenshots/web.png)
