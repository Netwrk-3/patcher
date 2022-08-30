#!/bin/bash
# Patcher's installation script

RED='\033[0;31m'
NC='\033[0m'

main() {
        if [ "$(id -u)" -ne 0 ]; then
                printf "${RED}[!] Error:${NC} patcher's installation script requires evelavted privilages!\n"
        else
                echo "installing patcher..."
                cd src && cp patcher.bash patcher &&chmod +x patcher && cp ./patcher /usr/local/bin
                echo "Done!"
        fi
}

main
