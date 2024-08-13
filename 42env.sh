#!/bin/bash

COLOR_YELLOW="\e[33m"
COLOR_MAGENTA="\e[35m"
COLOR_CYAN="\e[36m"
COLOR_GREY="\e[90m"
COLOR_RED="\e[91m"
COLOR_GREEN="\e[92m"
COLOR_BLUE="\e[94m"
COLOR_WHITE="\e[97m"
COLOR_RESET="\e[0m"

banner() {
    echo -e "${COLOR_GREY}"
    cat << "EOF"

  ┌─────────────────────────────────────────────────────────────┐
  │       ██╗  ██╗██████╗     ███████╗███╗   ██╗██╗   ██╗       │
  │       ██║  ██║╚════██╗    ██╔════╝████╗  ██║██║   ██║       │
  │       ███████║ █████╔╝    █████╗  ██╔██╗ ██║██║   ██║       │
  │       ╚════██║██╔═══╝     ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝       │
  │            ██║███████╗    ███████╗██║ ╚████║ ╚████╔╝        │
  │            ╚═╝╚══════╝    ╚══════╝╚═╝  ╚═══╝  ╚═══╝         │
  └─────────────────────────────────────────────────────────────┘
EOF
echo -e "${COLOR_RESET}${COLOR_WHITE}"
echo -e ">> 42ENV | 42 Environment Configuration Script"
echo ""
echo -e ">> Si te sirvió este script, dale '★ Star' en el repositorio. ¡Gracias!"
echo -e ">> ${COLOR_BLUE}https://github.com/WildZarek/42env${COLOR_WHITE}"
echo -e ">> forked from: ${COLOR_BLUE}https://github.com/4ndymcfly/42env${COLOR_RESET}"
echo ""
sleep 3
}

clear
banner

print_info() {
    echo -ne "${COLOR_WHITE}[${COLOR_CYAN}>${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_installed() {
    echo -e "${COLOR_WHITE}[${COLOR_MAGENTA}i${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_warning() {
    echo -e "${COLOR_WHITE}[${COLOR_RED}!${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_ok() {
    echo -e "${COLOR_GREEN}OK${COLOR_RESET}"
}

sudo -v
while true; do sudo -n true; sleep 60; sudo -v; done 2>/dev/null &

print_info "Escribe tu usuario de la Intra 42: "
read USER
INTRAUSER="${USER}"

check_and_install() {
    if ! command -v $1 &> /dev/null
    then
        print_info "${COLOR_YELLOW}$1${COLOR_WHITE} no está instalado. Instalando..."
        sudo apt-get install -y $2 > /dev/null 2>&1
        sleep 2
        print_ok
    else
        print_installed "${COLOR_YELLOW}$1${COLOR_WHITE} ya está instalado."
    fi
}

# Actualizar e instalar programas y dependencias generales
print_info "Actualizando sistema..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1
sudo apt-get install -y software-properties-common build-essential curl wget unzip > /dev/null 2>&1
print_ok

check_and_install "zsh" "zsh"
check_and_install "terminator" "terminator"
check_and_install "git" "git"
check_and_install "python3" "python3"
check_and_install "pip3" "python3-pip"
check_and_install "gcc" "gcc"
check_and_install "make" "make"
check_and_install "rg" "ripgrep"
check_and_install "fdfind" "fd-find"
check_and_install "nvim" "neovim"
check_and_install "luarocks" "luarocks"

#Instalaciones opcionales
#check_and_install "pipx" "pipx"
#check_and_install "btop" "btop"
#check_and_install "node" "nodejs"
#check_and_install "npm" "npm"
#check_and_install "yarn" "yarn"

sleep 3

# Fix for 'fdfind' command in Ubuntu and Debian
export PATH="$HOME/.local/bin:$PATH"
if [ ! $(which fd) ]; then
    ln -s $(which fdfind) ~/.local/bin/fd
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    print_info "Configurando ${COLOR_YELLOW}zsh${COLOR_WHITE} como shell por defecto..."
    sudo chsh -s $(which zsh) $(whoami)
    sleep 2
    print_ok
fi

ZSHRC_FILE="$HOME/.zshrc"
if [ ! -f "$ZSHRC_FILE" ]; then
    # Copiar el archivo .zshrc desde la raíz del script si no existe
    if [ -f "./files/.zshrc" ]; then
        print_info "Copiando archivo ${COLOR_YELLOW}.zshrc${COLOR_WHITE} desde el archivo de configuración en la raíz del script..."
        cp "./files/.zshrc" "$ZSHRC_FILE"
        sleep 2
        print_ok
    else
        print_warning "No se encontró el archivo ${COLOR_YELLOW}.zshrc${COLOR_WHITE} en la ruta actual."
    fi
else
    # Añadir los alias al .zshrc si el archivo ya existe y no existen otros alias definidos
    if [ ! -z $(grep "ALIASES" "$HOME/.zshrc") ]; then
        print_info "Añadiendo los alias al archivo ${COLOR_YELLOW}.zshrc${COLOR_WHITE}..."
        echo -e "\n# ALIASES\nalias c='clear'\nalias caa='cat */*'\nalias cca='cc -Wall -Wextra -Werror -o \$1 *.c'\nalias ccf='cc -Wall -Wextra -Werror \$1'\nalias ccg='cc -Wall -Wextra -Werror -g -o \$1'\nalias gcf='gcc -Wall -Wextra -Werror -o \$1'\nalias gts='git status'\nalias gta='git add \$1'\nalias gtaa='git add .'\nalias gtc='git commit -m \$1'\nalias gtpu='git push -u origin master'\nalias gtp='git push'\nalias gtd='git diff \$1'\nalias gtl=\"git log --format='%h | %ce | %cs | %ch' -n10\"\nalias ll='/usr/bin/lsd -lha --group-dirs=first'\nalias llo='/usr/bin/lsd -lha --group-dirs=first --permission octal'\nalias ls='/usr/bin/lsd --group-dirs=first'\nalias nt='norminette -R CheckForbiddenSourceHeader'\nalias fl='ft_lock'\nalias vi='/usr/bin/nvim'\n" >> "$ZSHRC_FILE"
        sleep 2
        print_ok
    else
        print_warning "Ya existen alias definidos. Ignorando configuración..."
    fi
fi

#Instalación de Oh-my-Zsh y plugins estilo fish
if [ ! -d $ZSH ]; then
    print_info "Instalando ${COLOR_YELLOW}Oh-My-Zsh${COLOR_WHITE}..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sleep 2
    print_ok
else
    print_installed "Paquete ${COLOR_YELLOW}Oh-My-Zsh${COLOR_WHITE} ya está instalado."
fi

ZSH_PLUGIN1_PATH="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
if [ ! -d $ZSH_PLUGIN1_PATH ]; then
    print_info "Instalando plugin ${COLOR_YELLOW}zsh-autosuggestions${COLOR_WHITE}..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN1_PATH
    sleep 2
    print_ok
else
    print_installed "Plugin ${COLOR_YELLOW}zsh-autosuggestions${COLOR_WHITE} ya está instalado."
fi

ZSH_PLUGIN2_PATH="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
if [ ! -d $ZSH_PLUGIN2_PATH ]; then
    print_info "Instalando plugin ${COLOR_YELLOW}zsh-syntax-highlighting${COLOR_WHITE}..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN2_PATH
    sleep 2
    print_ok
else
    print_installed "Plugin ${COLOR_YELLOW}zsh-syntax-highlighting${COLOR_WHITE} ya está instalado."
fi

if ! pip3 show norminette &> /dev/null
then
    print_info "${COLOR_YELLOW}norminette${COLOR_WHITE} no está instalada. Instalando..."
    pip3 install norminette > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "${COLOR_YELLOW}norminette${COLOR_WHITE} ya está instalada."
fi

if ! pip3 show c-formatter-42 &> /dev/null
then
    print_info "${COLOR_YELLOW}c-formatter-42${COLOR_WHITE} no está instalado. Instalando..."
    pip3 install c-formatter-42 > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "${COLOR_YELLOW}c-formatter-42${COLOR_WHITE} ya está instalado."
fi

if ! pip3 show neovim &> /dev/null
then
    print_info "Librería ${COLOR_YELLOW}neovim${COLOR_WHITE} para Python no está instalada. Instalando..."
    pip3 install neovim > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "Librería ${COLOR_YELLOW}neovim${COLOR_WHITE} ya está instalada."
fi

FONT_DIR="/usr/local/share/fonts"
FONT_NAME="Hack"
if ! fc-list | grep -q "$FONT_NAME"; then
    print_info "Instalando ${COLOR_YELLOW}Hack Nerd Font${COLOR_WHITE}..."
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -O /tmp/Hack.zip > /dev/null 2>&1
    sudo unzip -q /tmp/Hack.zip -d $FONT_DIR > /dev/null 2>&1
    sudo fc-cache -f -v > /dev/null 2>&1
    print_ok
else
    print_installed "La fuente ${COLOR_YELLOW}Hack Nerd Font${COLOR_WHITE} ya está instalada."
fi

VIMRC_SRC="./files/.vimrc"
if [ -f $VIMRC_SRC ]; then
    if [ ! -f $HOME/.vimrc ]; then
        print_info "Copiando archivo ${COLOR_YELLOW}.vimrc${COLOR_WHITE} al home del usuario..."
        echo -e "let g:user42 = '${INTRAUSER}'" >> $VIMRC_SRC
        echo -e "let g:mail42 = '${INTRAUSER}@student.42malaga.com'" >> $VIMRC_SRC
        cp "$VIMSRC" "$HOME"
        sleep 1
        print_ok
    else
        print_installed "Archivo ${COLOR_YELLOW}.vimrc${COLOR_WHITE} ya existente. Ignorando..."
        print_info "Configurando variables para el header de 42..."
        echo -e "let g:user42 = '${INTRAUSER}'" >> $VIMRC_SRC
        echo -e "let g:mail42 = '${INTRAUSER}@student.42malaga.com'" >> $VIMRC_SRC
        sleep 1
        print_ok
    fi
else
    print_warning "No se encontró el archivo ${COLOR_YELLOW}.vimrc${COLOR_WHITE} en la ruta actual."
fi

KEYMAPS_LUA_SRC="./files/keymaps.lua"
KEYMAPS_LUA_DEST="$HOME/.config/nvim/lua/config/"
if [ -f "$KEYMAPS_LUA_SRC" ]; then
    if [ -d $KEYMAPS_LUA_DEST ]; then
        print_info "Copiando archivo ${COLOR_YELLOW}keymaps.lua${COLOR_WHITE} al directorio de configuración de nvim..."
        cp "$KEYMAPS_LUA_SRC" "$KEYMAPS_LUA_DEST"
        sleep 1
        print_ok
    else:
        print_warning "No se encontró el directorio de configuración de nvim. Creando los directorios..."
        mkdir -p $KEYMAPS_LUA_DEST
        sleep 1
        print_ok
        print_info "Copiando archivo ${COLOR_YELLOW}keymaps.lua${COLOR_WHITE} al directorio de configuración de nvim..."
        cp "$KEYMAPS_LUA_SRC" "$KEYMAPS_LUA_DEST"
        sleep 1
        print_ok
    fi
else
    print_warning "No se encontró el archivo ${COLOR_YELLOW}keymaps.lua${COLOR_WHITE} en la ruta actual."
fi

FORMATTER_42_SRC="./files/c_formatter_42.vim"
FORMATTER_42_DEST="$HOME/.config/nvim/lua/plugins/"

if [ -f "$FORMATTER_42_SRC" ]; then
    if [ -d $FORMATTER_42_DEST ]; then
        print_info "Copiando plugin ${COLOR_YELLOW}c_formatter_42.vim${COLOR_WHITE} al directorio de plugins de nvim..."
        cp "$FORMATTER_42_SRC" "$FORMATTER_42_DEST"
        sleep 1
        print_ok
    else
        print_warning "No se encontró el directorio de plugins de nvim. Creando los directorios..."
        mkdir -p $FORMATTER_42_DEST
        sleep 1
        print_ok
        print_info "Copiando plugin ${COLOR_YELLOW}c_formatter_42.vim${COLOR_WHITE} al directorio de plugins de nvim..."
        cp "$FORMATTER_42_SRC" "$FORMATTER_42_DEST"
        sleep 1
        print_ok
    fi
else
    print_warning "No se encontró el archivo ${COLOR_YELLOW}c_formatter_42.vim${COLOR_WHITE} en la ruta actual."
fi

if [ ! $(command -v lazygit) ]; then
    print_info "Instalando ${COLOR_YELLOW}LazyGit${COLOR_WHITE}..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" > /dev/null 2>&1
    tar xf lazygit.tar.gz lazygit > /dev/null 2>&1
    sudo install lazygit /usr/local/bin > /dev/null 2>&1
    rm lazygit.tar.gz > /dev/null 2>&1
    sleep 1
    print_ok
else
    print_installed "Paquete ${COLOR_YELLOW}LazyGit${COLOR_WHITE} ya está instalado."
fi

if [ ! $(command -v lsd) ]; then
    print_info "Instalando ${COLOR_YELLOW}LSD${COLOR_WHITE}..."
    LSD_URL="https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64.deb"
    LSD_DEB="lsd-musl_1.1.2_amd64.deb"
    curl -Lo $LSD_DEB $LSD_URL > /dev/null 2>&1
    sudo dpkg -i $LSD_DEB > /dev/null 2>&1
    rm $LSD_DEB > /dev/null 2>&1
    sleep 1
    print_ok
else
    print_installed "Paquete ${COLOR_YELLOW}LSD${COLOR_WHITE} ya está instalado."
fi

echo ""

print_installed "Todos los programas necesarios han sido instalados."

if [ -d ./lazygit ]; then
    rm ./lazygit
fi

echo ""

sleep 1
print_installed "[${COLOR_RED}ATENCIÓN${COLOR_WHITE}] El sistema se reiniciará para aplicar todos los cambios."
print_info "Después del reinicio, ejecuta 'nvim' para que la configuración de Neovim se complete."

echo ""
echo ""

sleep 1
read -p "Pulse la tecla INTRO para reiniciar el sistema..."
sudo reboot
