#!/bin/bash
# Patcher's installation script

RED='\033[0;31m'
NC='\033[0m'

main() {
        if [ "$(id -u)" -ne 0 ]; then
                printf "${RED}[!] Error:${NC} patcher's installation script requires evelavted privilages!\n"
        else
                echo "installing patcher..."
                cp ./src/patcher.bash /usr/local/bin/patcher && chmod +x /usr/local/bin/patcher
                echo "Done!"
        fi
}

main
