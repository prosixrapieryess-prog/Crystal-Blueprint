#!/bin/bash
 
# ===============================
# 🎨 THEME CONFIG (BLUEPRINT)
# ===============================
BLUE="\e[34m"
CYAN="\e[36m"
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
MAGENTA="\e[35m"
WHITE="\e[97m"
ORANGE="\e[38;5;214m"
PURPLE="\e[38;5;129m"
PINK="\e[38;5;213m"
RESET="\e[0m"
BOLD="\e[1m"
BLINK="\e[5m"
 
clear
 
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
# 🧠 HEADER BANNER
# ===============================
banner() {
clear
 
echo -e ""
echo -ne "  "
rainbow_text "██████╗ ██████╗  ██████╗ ██╗  ██╗"
echo -ne "  "
rainbow_text "██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝"
echo -ne "  "
rainbow_text "██████╔╝██████╔╝██║   ██║ ╚███╔╝ "
echo -ne "  "
rainbow_text "██╔═══╝ ██╔══██╗██║   ██║ ██╔██╗ "
echo -ne "  "
rainbow_text "██║     ██║  ██║╚██████╔╝██╔╝ ██╗"
echo -ne "  "
rainbow_text "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
echo ""
 
echo -ne "  "
rainbow_text "██╗     ███████╗ ██████╗ ███████╗███╗   ██╗██████╗ "
echo -ne "  "
rainbow_text "██║     ██╔════╝██╔════╝ ██╔════╝████╗  ██║██╔══██╗"
echo -ne "  "
rainbow_text "██║     █████╗  ██║  ███╗█████╗  ██╔██╗ ██║██║  ██║"
echo -ne "  "
rainbow_text "██║     ██╔══╝  ██║   ██║██╔══╝  ██║╚██╗██║██║  ██║"
echo -ne "  "
rainbow_text "███████╗███████╗╚██████╔╝███████╗██║ ╚████║██████╔╝"
echo -ne "  "
rainbow_text "╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═════╝ "
echo ""
 
echo -ne "  "
rainbow_text "██╗   ██╗████████╗"
echo -ne "  "
rainbow_text "╚██╗ ██╔╝╚══██╔══╝"
echo -ne "  "
rainbow_text " ╚████╔╝    ██║   "
echo -ne "  "
rainbow_text "  ╚██╔╝     ██║   "
echo -ne "  "
rainbow_text "   ██║      ██║   "
echo -ne "  "
rainbow_text "   ╚═╝      ╚═╝   "
echo ""
 
echo -e "  ${BOLD}${YELLOW}⚡${RESET}  ${BOLD}${WHITE}ProXLegendYT Development & VPS Management Suite${RESET}  ${BOLD}${YELLOW}⚡${RESET}"
echo -e "  ${MAGENTA}Powered by ProXLegendYT Engine${RESET}  ${CYAN}|${RESET}  ${GREEN}Ultra Edition${RESET}  ${CYAN}|${RESET}  ${ORANGE}v5.0.0${RESET}"
echo ""
echo -e "  ${CYAN}$(printf '━%.0s' {1..52})${RESET}"
echo -e "  ${BOLD}${BLUE}     🚀 BLUEPRINT CONTROL PANEL${RESET}"
echo -e "  ${BOLD}${PURPLE}     🎨 Theme UI  •  Modern  •  Fast${RESET}"
echo -e "  ${CYAN}$(printf '━%.0s' {1..52})${RESET}"
echo ""
}
 
# ===============================
# 📋 MAIN MENU
# ===============================
menu() {
banner
echo -e "  ${BOLD}${YELLOW}┌─────────────────────────────┐${RESET}"
echo -e "  ${BOLD}${YELLOW}│        SELECT OPTION        │${RESET}"
echo -e "  ${BOLD}${YELLOW}└─────────────────────────────┘${RESET}"
echo ""
echo -e "  ${RED}[${RESET}${BOLD}${WHITE}1${RESET}${RED}]${RESET}  ${GREEN}⚙  Blueprint Tools${RESET}"
echo -e "  ${MAGENTA}[${RESET}${BOLD}${WHITE}2${RESET}${MAGENTA}]${RESET}  ${CYAN}🎨 Theme Manager${RESET}"
echo -e "  ${BLUE}[${RESET}${BOLD}${WHITE}3${RESET}${BLUE}]${RESET}  ${RED}✖  Exit${RESET}"
echo ""
echo -e "  ${CYAN}$(printf '─%.0s' {1..35})${RESET}"
echo -ne "  ${BOLD}${YELLOW}➜ ${WHITE}Select Option: ${RESET}"
read opt
 
case $opt in
1) bash <(curl -fsSL https://raw.githubusercontent.com/nobita329/hub/refs/heads/main/Codinghub/thames/meng.sh) ;;
2) bash <(curl -fsSL https://raw.githubusercontent.com/prosixrapieryess-prog/Crystal-Blueprint/main/run.sh) ;;
3)
   echo ""
   echo -e "  ${BOLD}${RED}✖  Exiting... Goodbye!${RESET}"
   echo ""
   exit ;;
*) echo -e "\n  ${BOLD}${RED}⚠  Invalid Option! Try Again.${RESET}\n" ; sleep 1 ; menu ;;
esac
}
 
menu
