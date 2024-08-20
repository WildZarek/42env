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

print_warning() {
    echo -ne "${COLOR_WHITE}[${COLOR_RED}!${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_info() {
    echo -ne "${COLOR_WHITE}[${COLOR_CYAN}>${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_installed() {
    echo -e "${COLOR_WHITE}[${COLOR_MAGENTA}i${COLOR_WHITE}] $1${COLOR_RESET}"
}

print_ok() {
    echo -e "${COLOR_GREEN}OK${COLOR_RESET}"
}

print_pass() {
    echo -e "${COLOR_BLUE}PASS${COLOR_RESET}"
}

print_error() {
    echo -e "${COLOR_RED}ERROR${COLOR_RESET}"
}

sudo -v
while true; do sudo -n true; sleep 60; sudo -v; done 2>/dev/null &

print_info "Escribe tu usuario de la Intra 42: ${COLOR_RESET}"
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
sudo apt-get install -y software-properties-common build-essential curl wget unzip exuberant-ctags > /dev/null 2>&1
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
check_and_install "luarocks" "luarocks"
check_and_install "xclip" "xclip"

#Instalaciones opcionales
#check_and_install "pipx" "pipx"
#check_and_install "btop" "btop"
#check_and_install "node" "nodejs"
#check_and_install "npm" "npm"
#check_and_install "yarn" "yarn"

sleep 3

# Fix for 'fdfind' command in Debian
FD_SYMLINK_PATH="$HOME/.local/bin/fd"
FDFIND_PATH="$HOME/.local/bin/fdfind"
if [ ! $(which fd) ]; then
    if [ ! -L $FD_SYMLINK_PATH ]; thens
        ln -s $FDFIND_PATH $FD_SYMLINK_PATH
    fi
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    print_info "Configurando ${COLOR_YELLOW}zsh${COLOR_WHITE} como shell por defecto..."
    sudo chsh -s $(which zsh) $(whoami)
    sleep 2
    print_ok
fi

#Instalación de Oh-My-Zsh y plugins estilo fish
OMZ_SH_FILE="$HOME/.oh-my-zsh/oh-my-zsh.sh"
if [ ! -f $OMZ_SH_FILE ]; then
    print_info "Instalando ${COLOR_YELLOW}Oh-My-Zsh${COLOR_WHITE}..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1
    sleep 2
    # Doble validación por si no se instaló correctamente...
    if [ -f $OMZ_SH_FILE ]; then
        print_ok
    else
        print_warning "${COLOR_YELLOW}Oh-My-Zsh${COLOR_WHITE} no se instaló correctamente..."
        sleep 1
        print_pass
    fi
else
    print_installed "Paquete ${COLOR_YELLOW}Oh-My-Zsh${COLOR_WHITE} ya está instalado."
fi

ZSH_PLUGIN1_PATH="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
if [ -d $ZSH ] && [ ! -d $ZSH_PLUGIN1_PATH ]; then
    print_info "Instalando plugin ${COLOR_YELLOW}zsh-autosuggestions${COLOR_WHITE}..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN1_PATH > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "Plugin ${COLOR_YELLOW}zsh-autosuggestions${COLOR_WHITE} ya está instalado."
fi

ZSH_PLUGIN2_PATH="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
if [ -d $ZSH ] && [ ! -d $ZSH_PLUGIN2_PATH ]; then
    print_info "Instalando plugin ${COLOR_YELLOW}zsh-syntax-highlighting${COLOR_WHITE}..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN2_PATH > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "Plugin ${COLOR_YELLOW}zsh-syntax-highlighting${COLOR_WHITE} ya está instalado."
fi

ZSHRC_SRC="./files/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"
ALIASES_FILE="./files/aliases.txt"
if [ -f "$ZSHRC_SRC" ]; then
    if [ -f $ZSHRC_DEST ]; then
        print_info "Copiando el archivo de configuración ${COLOR_YELLOW}.zshrc${COLOR_WHITE}..."
        mv "$ZSHRC_DEST" "$HOME/.zshrc.pre-42env"
        cp "$ZSHRC_SRC" "$ZSHRC_DEST"
        sleep 2
        print_ok
        # Añadir los alias al .zshrc si el archivo ya existe y no existen otros alias definidos
        if ! grep -q "ALIASES" "$ZSHRC_DEST"; then
            print_info "Añadiendo los alias al archivo ${COLOR_YELLOW}.zshrc${COLOR_WHITE}..."
            cat "$ALIASES_FILE" >> "$ZSHRC_DEST"
            sleep 2
            print_ok
        else
            print_warning "Ya existen alias definidos. Cancelando configuración..."
            sleep 1
            print_pass
        fi
    fi
else
    print_warning "No se encontró el archivo ${COLOR_YELLOW}.zshrc${COLOR_WHITE} en la ruta de origen..."
    sleep 1
    print_error
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
    print_info "Instalando la fuente ${COLOR_YELLOW}Hack Nerd Font${COLOR_WHITE}..."
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -O /tmp/Hack.zip
    sudo unzip -q /tmp/Hack.zip -d $FONT_DIR > /dev/null 2>&1
    sudo fc-cache -f -v > /dev/null 2>&1
    print_ok
else
    print_installed "La fuente ${COLOR_YELLOW}Hack Nerd Font${COLOR_WHITE} ya está instalada."
fi

# Instalación de Nvim desde Snap
if command -v nvim > /dev/null 2>&1; then
    print_installed "${COLOR_YELLOW}NeoVim${COLOR_WHITE} ya está instalado."
else
    print_info "Instalando ${COLOR_YELLOW}Neovim${COLOR_WHITE}..."
    sudo snap install --classic nvim > /dev/null 2>&1
    sleep 2
    print_ok
fi

# Configuración de Neovim + Plugins
# Plugins Path: $HOME/.local/share/nvim/plugged
VIMPLUG_FILE="$HOME/.local/share/nvim/site/autoload/plug.vim"
if [ $(which nvim) ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1
    if [ -f $VIMPLUG_FILE ]; then
        print_info "Gestor de plugins ${COLOR_YELLOW}Vim-Plug${COLOR_WHITE} para NeoVim instalado..."
        sleep 1
        print_ok
    else
        print_warning "El gestor de plugins ${COLOR_YELLOW}Vim-Plug${COLOR_WHITE} para NeoVim no se instaló correctamente..."
        sleep 1
        print_error
    fi
else
    print_warning "${COLOR_YELLOW}NeoVim${COLOR_WHITE} no se instaló correctamente..."
    sleep 1
    print_error
fi

NVIM_SRC="./files/init.vim"
NVIM_DEST="$HOME/.config/nvim/lua"
NVIM_CFG_FILE="$NVIM_DEST/init.vim"
if [ -f $NVIM_SRC ]; then
    if [ ! -d $NVIM_DEST ]; then
        mkdir -p $NVIM_DEST
    else
        if [ ! -f $NVIM_CFG_FILE ]; then
            print_info "Copiando archivo ${COLOR_YELLOW}init.vim${COLOR_WHITE}..."
            cp "$NVIM_SRC" "$NVIM_CFG_FILE"
            sed -i "s/INTRAUSER/$INTRAUSER/g" "$NVIM_CFG_FILE"
            sleep 1
            print_ok
        else
            print_installed "Archivo ${COLOR_YELLOW}init.vim${COLOR_WHITE} ya existente. Cancelando copia..."
            sleep 1
            print_pass
            if [ ! $(grep -q "let g:user42" $NVIM_CFG_FILE) ] && [ ! $(grep -q "let g:mail42" $NVIM_CFG_FILE) ]; then
                print_info "Configurando variables para el header de 42..."
                echo -e "let g:user42 = '${INTRAUSER}'" >> $NVIM_CFG_FILE
                echo -e "let g:mail42 = '${INTRAUSER}@student.42malaga.com'" >> $NVIM_CFG_FILE
                sleep 1
                print_ok
            else
                print_installed "El usuario de la Intra 42 ya está configurado."
            fi
        fi
    fi
else
    print_warning "No se encontró el archivo ${COLOR_YELLOW}init.vim${COLOR_WHITE} en la ruta de origen..."
    sleep 1
    print_error
fi

KEYMAPS_LUA_SRC="./files/keymaps.lua"
KEYMAPS_LUA_DEST="$HOME/.config/nvim/lua/configs/"
if [ -f "$KEYMAPS_LUA_SRC" ]; then
    if [ -d $KEYMAPS_LUA_DEST ]; then
        print_info "Copiando archivo ${COLOR_YELLOW}keymaps.lua${COLOR_WHITE} al directorio de configuración de nvim..."
        cp "$KEYMAPS_LUA_SRC" "$KEYMAPS_LUA_DEST"
        sleep 1
        print_ok
    else
        print_warning "No se encontró el directorio 'configs' de nvim. Creando los directorios..."
        mkdir -p $KEYMAPS_LUA_DEST
        sleep 1
        print_ok
        print_info "Copiando archivo ${COLOR_YELLOW}keymaps.lua${COLOR_WHITE} al directorio de configuración de nvim..."
        cp "$KEYMAPS_LUA_SRC" "$KEYMAPS_LUA_DEST"
        sleep 1
        print_ok
    fi
else
    print_warning "No se encontró el archivo ${COLOR_YELLOW}keymaps.lua${COLOR_WHITE} en la ruta actual..."
    sleep 1
    print_error
fi

if [ ! $(command -v lazygit) ]; then
    print_info "Instalando ${COLOR_YELLOW}LazyGit${COLOR_WHITE}..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" > /dev/null 2>&1
    tar xf lazygit.tar.gz lazygit > /dev/null 2>&1
    sudo install lazygit /usr/local/bin > /dev/null 2>&1
    rm lazygit.tar.gz > /dev/null 2>&1
    rm lazygit > /dev/null 2>&1
    sleep 1
    print_ok
else
    print_installed "Paquete ${COLOR_YELLOW}LazyGit${COLOR_WHITE} ya está instalado."
fi

if [ ! $(command -v lsd) ]; then
    print_info "Instalando ${COLOR_YELLOW}lsd${COLOR_WHITE}..."
    LSD_URL="https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64.deb"
    LSD_DEB="lsd-musl_1.1.2_amd64.deb"
    curl -Lo $LSD_DEB $LSD_URL > /dev/null 2>&1
    sudo dpkg -i $LSD_DEB > /dev/null 2>&1
    rm $LSD_DEB > /dev/null 2>&1
    sleep 1
    print_ok
else
    print_installed "Paquete ${COLOR_YELLOW}lsd${COLOR_WHITE} ya está instalado."
fi

if [ ! $(command -v batcat) ]; then
    print_info "Instalando ${COLOR_YELLOW}bat${COLOR_WHITE}..."
    BAT_URL="https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-musl_0.24.0_amd64.deb"
    BAT_DEB="bat-musl_0.24.0_amd64.deb"
    curl -Lo $BAT_DEB $BAT_URL > /dev/null 2>&1
    sudo dpkg -i $BAT_DEB > /dev/null 2>&1
    rm $BAT_DEB > /dev/null 2>&1
    sleep 1
    print_ok
else
    print_installed "Paquete ${COLOR_YELLOW}bat${COLOR_WHITE} ya está instalado."
fi

echo ""

print_installed "Todos los programas necesarios han sido instalados."

if [ -d ./lazygit ]; then
    rm ./lazygit
fi

echo ""

sleep 1
print_installed "[${COLOR_RED}ATENCIÓN${COLOR_WHITE}] El sistema se reiniciará para aplicar todos los cambios."
print_info "Después del reinicio, ejecuta 'nvim' y escribe ':PlugInstall' para que la configuración de Neovim se complete."

echo ""
echo ""

sleep 1
read -p "Pulse la tecla INTRO para reiniciar el sistema..."
sudo reboot
