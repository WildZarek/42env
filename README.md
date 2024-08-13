
<div align="center">
  <img src="img/42_env_banner.png" alt="header_logo">
  <p>42 ENVironment Configuration Script</p>
</div>

# Descripción


Automatiza la instalación y configuración del entorno básico necesario para programar en el Cursus de 42.
Testeado en las siguientes distribuciones:

| Distribución                                             | Codename      |
| ----------------                                         | ------------- |
| [Ubuntu 22.04 LTS](https://releases.ubuntu.com/jammy/)   | Jammy         |
| [Debian 12 LTS](https://www.debian.org/releases/stable/) | Bookworm      |

<!-- Índice -->
# Índice

1. [Software](#software)
2. [Recomendaciones](#recomendaciones)
3. [Instalación](#instalación)
4. [Durante la ejecución](#durante-la-ejecución)
5. [LazyVim](#lazyvim)
    - [Uso básico de LazyVim](#uso-básico-de-lazyvim)
    - [Pestañas en LazyVim](#pestañas-en-lazyvim)
6. [Extras](#extras)
    - [LSD (LSDeluxe)](#lsd-lsdeluxe)
7. [En proceso...](#en-proceso)

## Software

Este script instala el siguiente software en el caso de que no esté instalado:

- **zsh |** [Shell ZSH](https://www.zsh.org/)
- **oh-my-zsh |** [Oh-My-Zsh](https://ohmyz.sh/)
- **zsh-autocompletions |** [Plugin zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- **zsh-syntax-highlighting |** [Plugin zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- **Terminator |** [Terminator](https://gnome-terminator.org/)
- **git |** [Git Fast Version Control](https://git-scm.com/doc)
- **python3 |** [Python 3.11.2](https://www.python.org/downloads/release/python-3112/)
- **pip3 |** [Package Installer for Python](https://pip.pypa.io/en/stable/)
- **ripgrep |** [Recursively searches by regex pattern](https://github.com/BurntSushi/ripgrep)
- **fd / fd-find |** [Simply alternative to 'find'](https://github.com/sharkdp/fd)
- **luarocks |** [Package manager for Lua modules](https://luarocks.org/)
- **nerd fonts |** [Iconic font aggregator, collection, and patcher](https://www.nerdfonts.com/) | Hack Nerd Font
- **lsd |** [The next gen ls command](https://github.com/lsd-rs/lsd)
- **lazygit |** [Simple terminal UI for git commands](https://github.com/jesseduffield/lazygit)
- Atajos de teclado para 'nvim' y config para .zshrc

## Recomendaciones

**IMPORTANTE:** Antes de comenzar el proceso se recomienda hacer copia de seguridad o un snapshot del estado actual de la máquina virtual.
Este script está pensado para uso en nuestro ordenador personal. Pronto publicaré la versión para usuarios limitados y compatibilidad con la mayor distros posibles..

## Instalación

<div align="center">
  <img src="img/001_running.png" alt="script running">
</div>

Primero descargamos el repositorio y entramos en la carpeta 42env del repositorio clonado.
```bash
git clone https://github.com/WildZarek/42env.git ; cd 42env
```
Ahora, asigna permisos de ejecución al script y ejecútalo. Se recomienda tener siempre maximizada la ventana de la shell.
```bash
chmod +x 42env.sh ; ./42env.sh
```
<div align="center">
  <img src="img/002_install_log.png" alt="install_log">
</div>

## Durante la ejecución

Al ejecutar el script, te pedirá tu usuario de la intra42; escríbelo y pulsa Enter. Este usuario se usará para configurar el header de C.

Una vez que haya terminado todo el proceso, pulsa la tecla Enter y se reiniciará el equipo.

Después de arrancar el sistema, abre Terminator, maximiza la ventana y ejecuta nvim.
```bash
nvim
```

Si no pulsas con el ratón en la ventana de instalación, puede que el instalador te pida que pulses una tecla. Si es tu caso, pulsa la tecla `espacio`. La configuración continuará y finalizará cuando te solicite que pulses `enter`.

## Extras

# LSD (LSDeluxe)
La configuración incluye la instalación de LSD, ya que mejora la legibilidad en la terminal aprovechando las Nerd Fonts instaladas.
El alias `ll` equivale a:
```bash
/usr/bin/lsd -lha --group-dirs=first
```
<img src=img/018_lsd_example.png alt="header_logo" align="center">

Si por más comodidad queremos ver los permisos de los archivos y carpetas en octal lo haremos con `llo` que es un alias de:
```bash
/usr/bin/lsd -lha --group-dirs=first --permission octal
```
<img src=img/019_lsd_example_octal.png alt="header_logo" align="center">

# LazyGit
LazyGit es ideal para quienes prefieren usar la terminal pero quieren una forma más cómoda y rápida de manejar Git sin tener que escribir todos los comandos manualmente. Resulta especialmente útil para desarrolladores que trabajan con repositorios grandes y complejos, ya que facilita la visualización de los cambios y permite moverse ágilmente entre las distintas secciones del repositorio.

> ¡Por probarlo no pierdes nada!

<div align="center">
  <img src="img/021_lazy_git.png" alt="lazy_git">
</div>

## Terminal

# Terminator
<div align="center">
  <img src="https://github.com/user-attachments/assets/57ab74e0-e41a-45fe-b677-cb2799135ff4" alt="Kitty Logo" width="500"/>
</div>

Kitty es una excelente opción si buscas un emulador de terminal que combine velocidad, personalización y funcionalidad avanzada, ideal para usuarios que desean aprovechar al máximo su entorno de trabajo en la terminal. Permite dividir la pantalla en varias terminales dentro de una misma ventana, facilitando la multitarea sin necesidad de usar múltiples ventanas. Kitty es un proyecto de código abierto con un desarrollo activo, lo que significa que recibe actualizaciones frecuentes y mejoras continuas.

## Atajos principales de teclado:

| Atajo | Descripción |
| --- | --- |
| `Ctrl` + `Shift` + `Enter` | Abrir una nueva ventana en el directorio actual |
| `Ctrl` + `Shift` + `w` | Cierra la terminal o la ventana activa |
| `Ctrl` + `Shift` + `T` | Abrir una nueva pestaña en el directorio actual |
| `Ctrl` + `Shift` + `Alt` + `T` | Renombra la pestaña en el directorio actual |
| `Ctrl` + `Shift` + `→` | Moverse a la pestaña de la derecha |
| `Ctrl` + `Shift` + `←` | Moverse a la pestaña de la izquierda |
| `Ctrl` + `←` | Mover a la ventana vecina a la izquierda |
| `Ctrl` + `→` | Mover a la ventana vecina a la derecha |
| `Ctrl` + `↑` | Mover a la ventana vecina hacia arriba |
| `Ctrl` + `↓` | Mover a la ventana vecina hacia abajo |
| `Ctrl` + `Shift` + `J` | Hacer la ventana más ancha |
| `Ctrl` + `Shift` + `L` | Hacer la ventana más estrecha |
| `Ctrl` + `Shift` + `I` | Hacer la ventana más alta |
| `Ctrl` + `Shift` + `K` | Hacer la ventana más baja |
| `Shift` + `Alt` + `↑` | Desplazar al principio del buffer de desplazamiento |
| `Shift` + `Alt` + `↓` | Desplazar al final del buffer de desplazamiento |
| `Shift` + `Alt` + `←` | Desplazar una página hacia arriba |
| `Shift` + `Alt` + `→` | Desplazar una página hacia abajo |
| `Ctrl` + `Shift` + `Z` | "Zoom" Alternar entre el diseño en mosaico o pantalla completa |

# En proceso...
Próximamente intentaré publicar el proyecto con un configuracion alternativa para su ejecución en usuarios con permisos limitados. Toda mejora es bienvenida. Si te ha gustado y te ha resultado práctico, no olvides darme una estrella.

### Gracias!

[Volver al índice](#índice)