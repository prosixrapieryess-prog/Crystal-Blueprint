#!/bin/bash
 
# ===============================
# 🎨 COLOR CONFIG
# ===============================
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
MAGENTA="\e[35m"
BLUE="\e[34m"
WHITE="\e[97m"
ORANGE="\e[38;5;214m"
PURPLE="\e[38;5;129m"
PINK="\e[38;5;213m"
RESET="\e[0m"
BOLD="\e[1m"
 
# ===============================
# 🌈 RAINBOW TEXT FUNCTION
# ===============================
rainbow_text() {
  local text="$1"
  local colors=("\e[31m" "\e[38;5;214m" "\e[33m" "\e[32m" "\e[34m" "\e[35m" "\e[36m")
  local i=0
  for (( c=0; c<${#text}; c++ )); do
    char="${text:$c:1}"
    echo -ne "${colors[$((i % ${#colors[@]}))]}\e[1m${char}"
    ((i++))
  done
  echo -e "\e[0m"
}
 
# ===============================
# 🌈 DIVIDER LINE
# ===============================
line() {
  echo -e "  ${CYAN}$(printf '━%.0s' {1..50})${RESET}"
}
 
thin_line() {
  echo -e "  ${PURPLE}$(printf '─%.0s' {1..50})${RESET}"
}
 
# ===============================
# 🚀 BRANDING BANNER
# ===============================
banner() {
  clear
  echo ""
  echo -ne "  "; rainbow_text "██████╗ ██████╗  ██████╗ ██╗  ██╗"
  echo -ne "  "; rainbow_text "██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝"
  echo -ne "  "; rainbow_text "██████╔╝██████╔╝██║   ██║ ╚███╔╝ "
  echo -ne "  "; rainbow_text "██╔═══╝ ██╔══██╗██║   ██║ ██╔██╗ "
  echo -ne "  "; rainbow_text "██║     ██║  ██║╚██████╔╝██╔╝ ██╗"
  echo -ne "  "; rainbow_text "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
  echo ""
  echo -ne "  "; rainbow_text "██╗     ███████╗ ██████╗ ███████╗███╗   ██╗██████╗ ██╗   ██╗████████╗"
  echo -ne "  "; rainbow_text "██║     ██╔════╝██╔════╝ ██╔════╝████╗  ██║██╔══██╗╚██╗ ██╔╝╚══██╔══╝"
  echo -ne "  "; rainbow_text "██║     █████╗  ██║  ███╗█████╗  ██╔██╗ ██║██║  ██║ ╚████╔╝    ██║   "
  echo -ne "  "; rainbow_text "██║     ██╔══╝  ██║   ██║██╔══╝  ██║╚██╗██║██║  ██║  ╚██╔╝     ██║   "
  echo -ne "  "; rainbow_text "███████╗███████╗╚██████╔╝███████╗██║ ╚████║██████╔╝   ██║      ██║   "
  echo -ne "  "; rainbow_text "╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═════╝    ╚═╝      ╚═╝   "
  echo ""
  echo -e "  ${BOLD}${YELLOW}⚡${RESET}  ${BOLD}${WHITE}ProXLegendYT Development & VPS Management Suite${RESET}  ${BOLD}${YELLOW}⚡${RESET}"
  echo -e "  ${MAGENTA}Powered by ProXLegendYT Engine${RESET}  ${CYAN}|${RESET}  ${GREEN}Ultra Edition${RESET}  ${CYAN}|${RESET}  ${ORANGE}v5.0.0${RESET}"
  echo ""
}
 
# ===============================
# ❌ UNINSTALL SUB-MENU
# ===============================
uninstall_menu() {
    while true; do
        banner
        line
        echo -e "  ${BOLD}${RED}           🗑  UNINSTALL MENU              ${RESET}"
        line
        echo ""
        echo -e "  ${RED}[${RESET}${BOLD}${WHITE}1${RESET}${RED}]${RESET}  ${ORANGE}🔴  Remove Nebula${RESET}"
        echo -e "  ${RED}[${RESET}${BOLD}${WHITE}2${RESET}${RED}]${RESET}  ${MAGENTA}🔴  Remove Euphoria${RESET}"
        echo -e "  ${RED}[${RESET}${BOLD}${WHITE}3${RESET}${RED}]${RESET}  ${YELLOW}🔴  Remove Add Tool Package${RESET}"
        echo -e "  ${BLUE}[${RESET}${BOLD}${WHITE}0${RESET}${BLUE}]${RESET}  ${CYAN}↩  Back${RESET}"
        echo ""
        thin_line
        echo -ne "  ${BOLD}${YELLOW}➜ ${WHITE}Choose an option: ${RESET}"
        read uopt
 
        case "$uopt" in
            1)
                echo ""
                echo -e "  ${BOLD}${RED}🧹 Removing Nebula…${RESET}"
                cd /var/www/pterodactyl || { echo -e "  ${RED}⚠  Path not found!${RESET}"; sleep 2; continue; }
                blueprint -r nebula
                echo -e "  ${BOLD}${GREEN}✨ Nebula removed successfully!${RESET}"
                sleep 2
            ;;
            2)
                echo ""
                echo -e "  ${BOLD}${RED}🧹 Removing Euphoria…${RESET}"
                cd /var/www/pterodactyl || { echo -e "  ${RED}⚠  Path not found!${RESET}"; sleep 2; continue; }
                blueprint -r euphoriatheme
                echo -e "  ${BOLD}${GREEN}✨ Euphoria removed successfully!${RESET}"
                sleep 2
            ;;
            3)
                echo ""
                echo -e "  ${BOLD}${RED}🧹 Removing Add Tool package…${RESET}"
                cd /var/www/pterodactyl || { echo -e "  ${RED}⚠  Path not found!${RESET}"; sleep 2; continue; }
                blueprint -r versionchanger
                blueprint -r mcplugins
                blueprint -r sagaminecraftplayermanager
                echo -e "  ${BOLD}${GREEN}✨ Add Tool package removed successfully!${RESET}"
                sleep 2
            ;;
            0)
                break
            ;;
            *)
                echo -e "\n  ${BOLD}${RED}⚠  Invalid option… try again.${RESET}\n"
                sleep 1
            ;;
        esac
    done
}
 
# ===============================
# 📋 MAIN MENU
# ===============================
while true; do
    banner
    line
    echo -e "  ${BOLD}${CYAN}              🚀  MAIN MENU                 ${RESET}"
    line
    echo ""
    echo -e "  ${GREEN}[${RESET}${BOLD}${WHITE}1${RESET}${GREEN}]${RESET}  ${CYAN}🌌  Nebula ${GREEN}(Auto Install)${RESET}"
    echo -e "  ${MAGENTA}[${RESET}${BOLD}${WHITE}2${RESET}${MAGENTA}]${RESET}  ${PINK}🌈  Euphoria ${GREEN}(Auto Install)${RESET}"
    echo -e "  ${RED}[${RESET}${BOLD}${WHITE}3${RESET}${RED}]${RESET}  ${ORANGE}🗑   Uninstall${RESET}"
    echo -e "  ${YELLOW}[${RESET}${BOLD}${WHITE}4${RESET}${YELLOW}]${RESET}  ${WHITE}🛠   Add Tool ${GREEN}(Auto Install)${RESET}"
    echo -e "  ${BLUE}[${RESET}${BOLD}${WHITE}0${RESET}${BLUE}]${RESET}  ${RED}✖   Exit${RESET}"
    echo ""
    thin_line
    echo -ne "  ${BOLD}${YELLOW}➜ ${WHITE}Choose an option: ${RESET}"
    read opt
 
    case "$opt" in
 
        1)
            echo ""
            echo -e "  ${BOLD}${GREEN}✨ Nebula auto-install starting…${RESET}"
            cd /var/www/pterodactyl || { echo -e "  ${RED}⚠  Path not found!${RESET}"; sleep 2; continue; }
            wget -q https://github.com/nobita329/The-Coding-Hub/raw/refs/heads/main/srv/thame/nebula.blueprint
            yes "" | blueprint -i nebula
            rm -f nebula.blueprint
            echo -e "  ${BOLD}${GREEN}🚀 Nebula installed successfully!${RESET}"
            sleep 2
        ;;
 
        2)
            echo ""
            echo -e "  ${BOLD}${MAGENTA}🌈 Euphoria auto-install starting…${RESET}"
            cd /var/www/pterodactyl || { echo -e "  ${RED}⚠  Path not found!${RESET}"; sleep 2; continue; }
            wget -q https://github.com/nobita329/The-Coding-Hub/raw/refs/heads/main/srv/thame/euphoriatheme.blueprint
            blueprint -i euphoriatheme
            rm -f euphoriatheme.blueprint
            echo -e "  ${BOLD}${GREEN}🌟 Euphoria installed successfully!${RESET}"
            sleep 2
        ;;
 
        3)
            uninstall_menu
        ;;
 
        4)
            echo ""
            echo -e "  ${BOLD}${YELLOW}🛠  Add Tool auto-install starting…${RESET}"
            cd /var/www/pterodactyl || { echo -e "  ${RED}⚠  Path not found!${RESET}"; sleep 2; continue; }
            wget -q https://github.com/nobita329/The-Coding-Hub/raw/refs/heads/main/srv/thame/versionchanger.blueprint
            wget -q https://github.com/nobita329/The-Coding-Hub/raw/refs/heads/main/srv/thame/mcplugins.blueprint
            wget -q https://github.com/nobita329/The-Coding-Hub/raw/refs/heads/main/srv/thame/sagaminecraftplayermanager.blueprint
            wget -q https://github.com/nobita329/The-Coding-Hub/raw/refs/heads/main/srv/thame/huxregister.blueprint
            blueprint -i versionchanger
            blueprint -i mcplugins
            blueprint -i sagaminecraftplayermanager
            blueprint -i huxregister.blueprint
            rm -f versionchanger.blueprint mcplugins.blueprint sagaminecraftplayermanager.blueprint huxregister.blueprint
            echo -e "  ${BOLD}${GREEN}🧩 Add Tool package installed successfully!${RESET}"
            sleep 2
        ;;
 
        0)
            echo ""
            echo -e "  ${BOLD}${CYAN}Goodbye, legend… 🚀${RESET}"
            echo ""
            exit 0
        ;;
 
        *)
            echo -e "\n  ${BOLD}${RED}⚠  Invalid option… try again.${RESET}\n"
            sleep 1
        ;;
    esac
done
