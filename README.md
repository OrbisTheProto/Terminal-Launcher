# Terminal Launcher 0.4.0
Created by OrbisTheProto

Uses the Universal Menu Selector library made by blue-Samarth on Github (https://github.com/blue-samarth/Terminal-Menu-Selector)

I honestly don't care if this is simple, as this is how I'm learning Bash scripting

# Dependencies
## Core Dependencies:
- bash
- topgrade (To update the system)

## Preferable Dependencies
- htop
- nano
- any package manager

## Optional Dependencies:
- snap (to install packages via snap)
- flatpak (to install packages via flatpak)
- Linux or MacOS (WSL sucks to run this on, and I'm not porting this to powershell) (MacOS is untested)

Anything in the "Scripts" section is technically optional if you don't select that option, but I would recommend it.

# How-To
## Download Guide
1. Clone the project via `git clone https://github.com/OrbisTheProto/Terminal-Launcher/`
2. extract to any directory
3. Make sure that everything is executable
4. Open your terminal in the folder
5. Run `./tl.sh`

## How to Develop Mods:
1. Make a Directory inside the Mods Folder
2. Put a mod.sh file inside the new directory
3. Make your mod! I recommend using the Universal Menu Selector library for submenus to keep it visually consistent.

## How to Run Mods:
1. Download the mod
2. Copy the mod folder to (TerminalLauncher Install Directory)/Mods
3. Make the mod.sh file executable
4. Launch the mod via the "Mods" menu on the main screen.
5. Enjoy!

**WARNING: Unofficial mods are not checked for security yet*. Check the mod.sh file in mods for dangerous code before executing**
*I can assure that any official mods will be relatively secure

# PLANS:
## 0.5 - Config Update
- 0.5.0 - Add installation config (toggleable snap, flatpak, etc.)
- 0.5.1 - Add a menu to configure options via text field/toggle
- 0.5.2 - Make pre-Github versions of the project public
## 0.6 - Better Mods Update
- 0.6.1 - Make mods more seamless (Toggleable via the Mods submenu, but showing up in the main menu or proper submenus instead of just the Mods submenu)
- 0.6.2 - Add mod security checks 
...
## 1.0 - RELEASE
- 1.0.0 - Make a full release on Github

# GPL Notice
Terminal Launcher: A Basic TUI launcher for Linux-Based Operating Systems
Copyright (C) 2026  OrbisTheProto

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see 'https://www.gnu.org/licenses/'.
