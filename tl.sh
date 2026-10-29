#!/bin/bash

# Initialize
if [[ ! -f "./menu_selector.sh" ]]; then
    echo "Error: Universal Menu Selector not found. Install it via the Github repo in the Readme" >&2
    exit 1
fi

source ./menu_selector.sh
clear

PS1=$(pwd)
version="0.4.0-Dev-20261029"
result=""
result2=""
result3=""
result4=""
pkg=""
install=""
aur=""
setup=""
CustomDist="0"
mod=$(cd Mods && printf '%s \n' *)

if [ -f $PS1/config.txt ]; then
    setup=1
fi

# First Time Setup

case $setup in
    "1")
    ;;

    *)
        echo -n "First Time Setup Initialized
Press ENTER..."
        read

        clear

        echo -n "Welcome to Terminal Launcher, A Basic TUI Launcher for Linux-based Operating Systems!!
Copyright (C) 2026  OrbisTheProto
For the full GPL notice, go to Settings > Info > License once you are done with setup or go to the README.

Press ENTER to continue."
        read

        clear

        touch $PS1/config.txt
        echo "# This is an Empty Config File. This usually means that something went wrong. Delete this file and go through the setup again." >> config.txt

        sleep 0.5

        menu_selector "Select your Distro Base" Distro \
            "Arch" \
            "Debian" \
            "Fedora/RHEL" \
            "Other" \
            "Not Listed"

            clear

            case $Distro in
                "Arch")
                    pkg=arch

                    menu_selector "Select your Distro" Distro \
                    "Arch" \
                    "Manjaro" \
                    "CachyOS" \
                    "EndeavorOS" \
                    "SteamOS" \
                    "Back"
                ;;
                "Debian")
                    pkg=debian

                    menu_selector "Select your Distro" Distro \
                    "Debian" \
                    "Ubuntu" \
                    "LinuxMint" \
                    "LMDE" \
                    "Knoppix" \
                    "Back"
                ;;

                "Fedora/RHEL")
                    pkg=fedora
                    menu_selector "Select your Distro" Distro \
                    "Fedora" \
                    "RHEL" \
                    "CentOS" \
                    "Back"
                ;;

                "Other")
                    menu_selector "Select your Distro" Distro \
                    "Gentoo" \
                    "Slackware" \
                    "FreeBSD" \
                    "GhostBSD" \
                    "OpenBSD" \
                    "TinyCore" \
                    "Back"
                    clear

                    echo -n "What package manager do you use? (if none, leave blank)
> "
                    read $pkg
                ;;

                "Not Listed")
                    echo -n "Input your Distro Name
>"
                    read $Distro
                ;;
            esac
    clear
    sed -i "1c\# This is the config file. For help, refer to the README" config.txt
    echo "dist=$pkg
distro1=$Distro
setup=1" >> config.txt

    echo "First time setup complete! To access these settings to change them, go to Settings > Setup.
"
    sleep 1
    echo -n "Press ENTER to continue to the Terminal Launcher"
    read
    ;;

esac
clear

###################################################################################################

#Launcher
source ./config.txt

while true; do
clear
echo -n "Welcome to Terminal Launcher, $USER!
"

fastfetch --logo-type small --config $PS1/fastfetch-config.jsonc

menu_selector "" result \
    "Update" \
    "Install" \
    "Scripts" \
    "Settings" \
    "Mods" \
    "Exit" \
    -- \
    "update" \
    "install" \
    "scripts" \
    "settings" \
    "mod" \
    "exit" \

case $result in
    "update")
        clear
        topgrade
        echo  -n "Press ENTER..."
        read
    ;;

    "install")
        pkg=""
        clear
        echo "Which Package Manager would you like to use?"
        menu_selector "" result3 \
            "Flatpak" \
            "Snap" \
            "System" \
            "Back"
        clear

        case $result3 in
        "Back")
        ;;

        *)
            echo -n "Which package would you like to install?
> "
            read pkg

            case $result3 in
                "Flatpak")
                    flatpak install $pkg
                ;;
                "Snap")
                snap install $pkg
                ;;
                "System")
                    case $dist in
                        "arch")
                            menu_selector "Is the package in the AUR?" aur \
                                "No" \
                                "Yes"
                            clear
                            case $aur in
                                "No")
                                    sudo pacman -S $pkg
                                ;;

                                "Yes")
                                    paru -S $pkg
                                ;;
                            esac
                        ;;
                        "deb")
                            sudo apt install $pkg
                        ;;
                        "fedora")
                            sudo dnf install $pkg
                        ;;
                        *)
                            sudo $dist $pkg
                        ;;
                    esac
                ;;
            esac

            echo -n "Press ENTER to exit to the main menu..."
            read
        ;;
        esac
    ;;

    "scripts")
        clear

        echo "Launch an app here:"

        menu_selector "" result2 \
            "nano" \
            "htop" \
            "Back"

        case $result2 in
            "nano")
                nano
            ;;

            "htop")
                htop
            ;;

            "Back")
            ;;
        esac
        cd $PS1
    ;;

    "settings")
    clear
        menu_selector "Settings Menu" result4 \
        "Setup" \
        "Info" \
        "Clear Config" \
        "Back"

        case $result4 in
        "Setup")
            clear
            menu_selector "Setup" result4 \
            "Package Manager" \
            "Distro" \
            "Back"

            case $result4 in
            "Package Manager")
                menu_selector "What is your distro based on?" Distro \
                "Arch" \
                "Fedora" \
                "Debian" \
                "Other"

                case $Distro in
                    "Arch")
                        pkg="arch"
                    ;;

                    "Fedora")
                        pkg="fedora"
                    ;;

                    "Debian")
                        pkg="debian"
                    ;;

                    "Other")
                        clear
                        pkg=""
                        syntax=""
                        echo -n "What command do you use? (e.g. apt, dnf, pacman)
> "
                        read $pkg
                        clear
                        echo -n "What syntax do you use? (e.g. install, -S, etc.)
> "
                        read $syntax
                        pkg="$pkg $syntax"
                    ;;
                esac
                sed -i "2c\dist=$pkg" config.txt
                pkg=""
                ;;

            "Distro")
            clear
                menu_selector "Select a Distro Base" Distro \
                "Arch" \
                "Debian" \
                "Fedora/RHEL" \
                "Other" \
                "Not Listed"
                clear
                case $Distro in
                    "Arch")
                        menu_selector "Select your Distro" Distro \
                        "Arch Linux" \
                        "Manjaro" \
                        "CachyOS" \
                        "EndeavorOS" \
                        "SteamOS" \
                        "Back"
                    ;;

                    "Debian")
                        menu_selector "Select your Distro" Distro \
                        "Debian" \
                        "Ubuntu" \
                        "Linux Mint" \
                        "LMDE" \
                        "Knoppix" \
                        "Back"
                    ;;

                    "Fedora/RHEL")
                        menu_selector "Select your Distro" Distro \
                        "Fedora" \
                        "RHEL" \
                        "CentOS" \
                        "Back"
                    ;;

                    "Other")
                        menu_selector "Select your Distro" Distro \
                        "Gentoo" \
                        "Slackware" \
                        "FreeBSD" \
                        "GhostBSD" \
                        "OpenBSD" \
                        "Tiny Core" \
                        "Back"
                    ;;

                    "Not Listed")
                        echo -n "Input your Distro Name
> "
                        read $dist
                        CustomDist=1
                    ;;
                esac

                case $CustomDist in
                    0)
                    sed -i "3c\distro1=$Distro" config.txt
                    ;;
                    1)
                    sed -i "3c\distro1=$dist" config.txt
                esac
            ;;

            "Back")
            ;;
            esac
        ;;

        "Clear Config")
            clear
            echo -n "Are you sure that you want to delete the config? Note that this will also exit the program. (y/N)
> "
            read result2

                case $result2 in
                y)
                    echo "Deleting Config..."
                    rm config.txt
                    sleep 1
                    echo "Exiting..."
                    sleep 1
                    exit
                ;;
                Y)
                    echo "Deleting Config..."
                    rm config.txt
                    sleep 1
                    echo "Exiting..."
                    sleep 1
                    exit
                ;;
                *)
                ;;
                esac
        ;;

        "Info")
            clear
            menu_selector "Info Center" result \
            "Program Info" \
            "License" \
            "AI Disclosure" \
            "Back" \
            -- \
            "info" \
            "license" \
            "ai" \
            "back"

            case $result in
            "info")
                clear

                echo -n "Terminal Launcher Version $version
Created by OrbisTheProto

Uses the Universal Menu Selector library made by blue-Samarth on Github

I honestly dont care if this is simple, as this is how i'm learning Bash scripting

This project is licensed under the GNU GPL v3. For more information, select the 'License' option in the Info menu.

RECENT UPDATES:
Dev 0.4.0-20261029
- Removed AI scripts, made them official mods
- Added the GPL notice to the README
- Set up the Github page for this project

Dev 0.4.0-20261028:
- Bumped Dev version up to 0.4.0
- Licensed Project under the GPL
- Added AI disclosure
- Added proper GPL stuff

Press ENTER to continue.
"
                read
            ;;
            "license")
                clear
                echo -n "GNU GPL v3 Full Notice:

Terminal Launcher: A Basic TUI launcher for Linux-Based Operating Systems
Copyright (C) 2026  OrbisTheProto

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see 'https://www.gnu.org/licenses/'.

Press ENTER to continue.
"
                read
            ;;
            "ai")
                clear
                echo -n "This project has limited AI usage, only being used as a last resort as I learn stuff with Bash.

The following feature(s) have AI-assisted code:

The 'Mod' menu being able to take folders in the Mod folder and make them into menu options

Press ENTER to continue.
"
                read
            ;;
            "back")
            ;;
            esac
            ;;
        "Back")
        ;;
        esac
    ;;

    "mod")
        clear
        menu_selector "Mod Menu" result \
        $mod

        case "$result" in
            *)
                cd "$PS1/Mods/$result/" || continue
                clear
                ./mod.sh
                cd "$PS1" || continue
                ;;
        esac
    ;;
    "exit")
        clear
        echo "Exiting..."
        sleep 1
        clear
        exit
    ;;
esac
done
