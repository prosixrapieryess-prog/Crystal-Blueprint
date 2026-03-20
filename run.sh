#!/bin/bash
 
# ═══════════════════════════════════════════════════════════════
#   ProXLegendYT Development & VPS Management Suite
#   Ultra Edition | v5.0.0
#   Powered by ProXLegendYT Engine
# ═══════════════════════════════════════════════════════════════
 
# ── ANSI Color Codes ──────────────────────────────────────────
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
 
# Standard colors
BLACK="\e[30m"
RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
BLUE="\e[94m"
MAGENTA="\e[95m"
CYAN="\e[96m"
WHITE="\e[97m"
 
# Background colors
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_BLUE="\e[44m"
BG_CYAN="\e[46m"
 
# Rainbow colors for gradient effect
R1="\e[91m"   # Red
R2="\e[93m"   # Yellow
R3="\e[92m"   # Green
R4="\e[96m"   # Cyan
R5="\e[94m"   # Blue
R6="\e[95m"   # Magenta
 
# ── Terminal Width ────────────────────────────────────────────
TERM_WIDTH=70
 
# ── Utility Functions ─────────────────────────────────────────
center_text() {
    local text="$1"
    local clean="${text//$'\e'[[0-9;]*m/}"
    local len=${#clean}
    local pad=$(( (TERM_WIDTH - len) / 2 ))
    printf "%${pad}s%b%s\n" "" "$text" ""
}
 
draw_line() {
    local char="${1:-─}"
    local color="${2:-$CYAN}"
    echo -e "${color}$(printf '%0.s'"$char" $(seq 1 $TERM_WIDTH))${RESET}"
}
 
draw_double_line() {
    echo -e "${CYAN}$(printf '%0.s═' $(seq 1 $TERM_WIDTH))${RESET}"
}
 
draw_thin_line() {
    echo -e "${DIM}${BLUE}$(printf '%0.s─' $(seq 1 $TERM_WIDTH))${RESET}"
}
 
pause() {
    echo ""
    echo -e "${DIM}${CYAN}$(printf '%0.s─' $(seq 1 $TERM_WIDTH))${RESET}"
    echo -e "   ${DIM}${WHITE}Press ${CYAN}[Enter]${WHITE} to continue...${RESET}"
    read -p "" dummy
}
 
# ── Per-letter colors (matching the pixel image) ─────────────
CP="\e[91m"   # P – bright red
CR="\e[93m"   # R – bright yellow
CO="\e[92m"   # O – bright green
CX="\e[96m"   # X – bright cyan
CL="\e[32m"   # L – green
CE1="\e[33m"  # E – amber/yellow
CG="\e[36m"   # G – teal
CE2="\e[95m"  # E – bright magenta/pink
CN="\e[94m"   # N – bright blue
CD="\e[35m"   # D – purple
CY="\e[96m"   # Y – cyan
CT="\e[91m"   # T – red
 
# ── Rainbow Banner ────────────────────────────────────────────
# Pixel block letters: P R O X L E G E N D Y T
draw_banner() {
    echo ""
    #           P         R         O         X         L         E         G         E         N         D         Y         T
    echo -e " ${CP}██████ ${CR}██████ ${CO} ████  ${CX}██  ██ ${CL}██     ${CE1}██████ ${CG} █████ ${CE2}██████ ${CN}██  ██ ${CD}█████  ${CY}██  ██ ${CT}██████${RESET}"
    echo -e " ${CP}██  ██ ${CR}██  ██ ${CO}██  ██ ${CX} ████  ${CL}██     ${CE1}██     ${CG}██     ${CE2}██     ${CN}███ ██ ${CD}██  ██ ${CY}██  ██ ${CT}  ██  ${RESET}"
    echo -e " ${CP}██████ ${CR}██████ ${CO}██  ██ ${CX}  ██   ${CL}██     ${CE1}████   ${CG}██ ███ ${CE2}████   ${CN}██████ ${CD}██  ██ ${CY} ████  ${CT}  ██  ${RESET}"
    echo -e " ${CP}██     ${CR}██ ██  ${CO}██  ██ ${CX} ████  ${CL}██     ${CE1}██     ${CG}██  ██ ${CE2}██     ${CN}██ ███ ${CD}██  ██ ${CY}  ██   ${CT}  ██  ${RESET}"
    echo -e " ${CP}██     ${CR}██  ██ ${CO} ████  ${CX}██  ██ ${CL}██████ ${CE1}██████ ${CG} █████ ${CE2}██████ ${CN}██  ██ ${CD}█████  ${CY}  ██   ${CT}  ██  ${RESET}"
    echo ""
    draw_double_line
    echo -e "   ${YELLOW}⚡${RESET}  ${BOLD}${WHITE}ProXLegendYT Development & VPS Management Suite${RESET}  ${YELLOW}⚡${RESET}"
    echo -e "   ${DIM}${CYAN}Powered by ProXLegendYT Engine${RESET}  ${DIM}│${RESET}  ${DIM}${MAGENTA}Ultra Edition${RESET}  ${DIM}│${RESET}  ${DIM}${GREEN}v5.0.0${RESET}"
    draw_double_line
}
 
# ── Status Badge ──────────────────────────────────────────────
get_status_badge() {
    if command -v blueprint >/dev/null 2>&1; then
        echo -e "${BOLD}${GREEN}  ● ONLINE  ${RESET}"
    else
        echo -e "${BOLD}${RED}  ● OFFLINE ${RESET}"
    fi
}
 
# ── Panel Header ─────────────────────────────────────────────
draw_panel_header() {
    local title="$1"
    echo ""
    echo -e "${CYAN}  ╭$(printf '%0.s─' $(seq 1 $((TERM_WIDTH - 4))))╮${RESET}"
    echo -e "${CYAN}  │${RESET}${BOLD}${WHITE}$(printf "  %-$((TERM_WIDTH - 6))s" "$title")${RESET}${CYAN}│${RESET}"
    echo -e "${CYAN}  ╰$(printf '%0.s─' $(seq 1 $((TERM_WIDTH - 4))))╯${RESET}"
}
 
# ── Menu Item ─────────────────────────────────────────────────
menu_item() {
    local key="$1"
    local label="$2"
    local icon="$3"
    local color="${4:-$GREEN}"
    echo -e "   ${BOLD}${CYAN}[${YELLOW}${key}${CYAN}]${RESET}  ${icon}  ${color}${label}${RESET}"
}
 
menu_item_danger() {
    local key="$1"
    local label="$2"
    local icon="$3"
    echo -e "   ${BOLD}${CYAN}[${RED}${key}${CYAN}]${RESET}  ${icon}  ${RED}${label}${RESET}"
}
 
# ═══════════════════════════════════════════════════════════════
#   MAIN MENU LOOP
# ═══════════════════════════════════════════════════════════════
while true; do
    clear
 
    if command -v blueprint >/dev/null 2>&1; then
        installed=true
    else
        installed=false
    fi
 
    draw_banner
 
    echo ""
    echo -e "   ${DIM}${WHITE}Blueprint Engine Status :${RESET}  $(get_status_badge)"
    echo ""
    draw_thin_line
    echo ""
    echo -e "   ${BOLD}${CYAN}MAIN MENU${RESET}  ${DIM}— Choose a module to manage${RESET}"
    echo ""
 
    menu_item  "1" "Blueprint Manager"   "📦"  "$CYAN"
    echo ""
    menu_item  "2" "Theme Manager"       "🎨"  "$MAGENTA"
    echo ""
    menu_item  "3" "Extensions Hub"      "🔌"  "$YELLOW"
    echo ""
    menu_item  "4" "Hyper V1 Installer"  "🚀"  "$GREEN"
 
    echo ""
    draw_thin_line
    echo ""
    menu_item_danger "0" "Exit" "🚪"
    echo ""
    draw_double_line
 
    echo -e "\n   ${YELLOW}➤${RESET} ${BOLD}Select Option :${RESET} \c"
    read main
 
    case $main in
 
    # ─────────────────────────────────────────────────────────
    #  MODULE 1 — BLUEPRINT MANAGER
    # ─────────────────────────────────────────────────────────
    1)
        while true; do
            clear
 
            if command -v blueprint >/dev/null 2>&1; then
                installed=true
            else
                installed=false
            fi
 
            draw_banner
            draw_panel_header " 📦  BLUEPRINT MANAGER"
            echo ""
            echo -e "   ${DIM}${WHITE}Blueprint Engine Status :${RESET}  $(get_status_badge)"
            echo ""
            draw_thin_line
            echo ""
 
            if [ "$installed" = false ]; then
                echo -e "   ${DIM}${RED}Blueprint is not installed on this system.${RESET}"
                echo ""
                menu_item "1" "Install Blueprint"     "⬇️ " "$GREEN"
                echo ""
                menu_item_danger "0" "Back to Main Menu" "◀ "
            else
                menu_item  "1" "Reinstall Blueprint"  "🔄"  "$CYAN"
                echo ""
                menu_item  "2" "Update Blueprint"     "⬆️ "  "$GREEN"
                echo ""
                menu_item  "3" "Blueprint Info"       "ℹ️ "  "$BLUE"
                echo ""
                menu_item  "4" "Check Version"        "🏷️ "  "$YELLOW"
                echo ""
                menu_item_danger "5" "Uninstall Blueprint"  "🗑️ "
                echo ""
                menu_item_danger "0" "Back to Main Menu"    "◀ "
            fi
 
            echo ""
            draw_double_line
 
            echo -e "\n   ${YELLOW}➤${RESET} ${BOLD}Select :${RESET} \c"
            read bp
 
            case $bp in
                1)
                    echo ""
                    if [ "$installed" = false ]; then
                        echo -e "   ${CYAN}⬇️   Installing Blueprint...${RESET}"
                        draw_thin_line
                        rm -f /etc/apt/keyrings/nodesource.gpg 2>/dev/null
                        yes | bash <(curl -s https://raw.githubusercontent.com/nobita329/hub/refs/heads/main/Codinghub/thames/install.sh)
                    else
                        echo -e "   ${CYAN}🔄  Reinstalling Blueprint...${RESET}"
                        draw_thin_line
                        yes | blueprint -rerun-install
                    fi
                    pause
                    ;;
                2)
                    echo ""
                    echo -e "   ${GREEN}⬆️   Updating Blueprint...${RESET}"
                    draw_thin_line
                    yes | blueprint -upgrade
                    pause
                    ;;
                3)
                    echo ""
                    echo -e "   ${BLUE}ℹ️   Blueprint Info${RESET}"
                    draw_thin_line
                    blueprint -info
                    pause
                    ;;
                4)
                    echo ""
                    echo -e "   ${YELLOW}🏷️   Blueprint Version${RESET}"
                    draw_thin_line
                    blueprint -version
                    pause
                    ;;
                5)
                    echo ""
                    echo -e "   ${RED}🗑️   Uninstalling Blueprint...${RESET}"
                    draw_thin_line
                    path=$(which blueprint 2>/dev/null)
                    if [ -n "$path" ]; then
                        rm -f "$path"
                        rm -rf ~/.blueprint ~/.config/blueprint /var/www/pterodactyl/.blueprint
                        echo -e "\n   ${GREEN}✔   Removed successfully!${RESET}"
                    else
                        echo -e "\n   ${RED}✘   Blueprint is not installed.${RESET}"
                    fi
                    pause
                    ;;
                0) break ;;
                *)
                    echo -e "\n   ${RED}✘  Invalid option. Try again.${RESET}"
                    sleep 1
                    ;;
            esac
        done
        ;;
 
    # ─────────────────────────────────────────────────────────
    #  MODULE 2 — THEME MANAGER
    # ─────────────────────────────────────────────────────────
    2)
        clear
        draw_banner
        draw_panel_header " 🎨  THEME MANAGER"
        echo ""
        echo -e "   ${MAGENTA}Launching Theme Manager...${RESET}"
        draw_thin_line
        bash <(curl -s https://raw.githubusercontent.com/nobita329/hub/refs/heads/main/Codinghub/thames/Theme/th.sh)
        pause
        ;;
 
    # ─────────────────────────────────────────────────────────
    #  MODULE 3 — EXTENSIONS HUB
    # ─────────────────────────────────────────────────────────
    3)
        clear
        draw_banner
        draw_panel_header " 🔌  EXTENSIONS HUB"
        echo ""
        echo -e "   ${YELLOW}Launching Extensions Hub...${RESET}"
        draw_thin_line
        bash <(curl -s https://raw.githubusercontent.com/nobita329/hub/refs/heads/main/Codinghub/thames/Extensions/ext.sh)
        pause
        ;;
 
    # ─────────────────────────────────────────────────────────
    #  MODULE 4 — HYPER V1 INSTALLER
    # ─────────────────────────────────────────────────────────
    4)
        clear
        draw_banner
        draw_panel_header " 🚀  HYPER V1 INSTALLER"
        echo ""
        echo -e "   ${GREEN}Initializing Hyper V1 installation sequence...${RESET}"
        draw_thin_line
        echo ""
        echo -e "   ${DIM}${CYAN}↳ Downloading installer...${RESET}"
        wget -q -O installer.sh https://r2.rolexdev.tech/hyperv1/installer.sh
        chmod +x installer.sh
        echo -e "   ${DIM}${CYAN}↳ Running installer...${RESET}"
        sudo ./installer.sh
        rm -f installer.sh
        echo ""
        echo -e "   ${DIM}${CYAN}↳ Clearing caches...${RESET}"
        cd /var/www/pterodactyl
        php artisan view:clear
        php artisan config:clear
        php artisan queue:restart
        echo -e "\n   ${GREEN}✔   Hyper V1 installation complete!${RESET}"
        pause
        ;;
 
    # ─────────────────────────────────────────────────────────
    #  EXIT
    # ─────────────────────────────────────────────────────────
    0)
        clear
        draw_banner
        echo ""
        echo -e "   ${YELLOW}⚡${RESET}  ${BOLD}${WHITE}Thank you for using ProXLegendYT Suite!${RESET}"
        echo -e "   ${DIM}${CYAN}Goodbye. Exiting...${RESET}"
        echo ""
        draw_double_line
        echo ""
        exit 0
        ;;
 
    *)
        echo -e "\n   ${RED}✘  Invalid option. Please try again.${RESET}"
        sleep 1
        ;;
    esac
done
