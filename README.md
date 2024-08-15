
<div align="center">
  <img src="assets/42_env_banner.png" alt="header_logo">
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
5. [Extras](#extras)
    - [LSD (LSDeluxe)](#lsd-lsdeluxe)
6. [En proceso...](#en-proceso)

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
- **bat |** [A cat clone with wings](https://github.com/sharkdp/bat)
- **lazygit |** [Simple terminal UI for git commands](https://github.com/jesseduffield/lazygit)
- Atajos de teclado para 'nvim' y config para .zshrc

## Recomendaciones

**IMPORTANTE:** Antes de comenzar el proceso se recomienda hacer copia de seguridad o un snapshot del estado actual de la máquina virtual.
Este script está pensado para uso en nuestro ordenador personal. Pronto publicaré la versión para usuarios limitados y compatibilidad con la mayor distros posibles..

## Instalación

<div align="center">
  <img src="assets/000_running.png" alt="script running">
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
  <img src="assets/001_install_log.png" alt="install_log">
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
<img src=assets/018_lsd_example.png alt="header_logo" align="center">

Si por más comodidad queremos ver los permisos de los archivos y carpetas en octal lo haremos con `llo` que es un alias de:
```bash
/usr/bin/lsd -lha --group-dirs=first --permission octal
```
<img src=assets/019_lsd_example_octal.png alt="header_logo" align="center">

# LazyGit
LazyGit es ideal para quienes prefieren usar la terminal pero quieren una forma más cómoda y rápida de manejar Git sin tener que escribir todos los comandos manualmente. Resulta especialmente útil para desarrolladores que trabajan con repositorios grandes y complejos, ya que facilita la visualización de los cambios y permite moverse ágilmente entre las distintas secciones del repositorio.

> ¡Por probarlo no pierdes nada!

<div align="center">
  <img src="assets/021_lazy_git.png" alt="lazy_git">
</div>

## Terminal

# Terminator
<div align="center">
  <img src="https://avatars.githubusercontent.com/u/63008829" alt="Terminal Logo" width="256"/>
</div>

<strong>Terminator</strong> es una excelente opción si buscas un emulador de terminal que combine velocidad, personalización y funcionalidad avanzada, ideal para usuarios que desean aprovechar al máximo su entorno de trabajo en la terminal. Permite dividir la pantalla en varias terminales dentro de una misma ventana, facilitando la multitarea sin necesidad de usar múltiples ventanas. Terminator es un proyecto de código abierto con un desarrollo activo, lo que significa que recibe actualizaciones frecuentes y mejoras continuas.

Terminator is a terminal emulator that lets you combine and recombine terminals in one window. It has features like titlebar, grouping, keyboard shortcuts, and web documentation.

## Atajos principales de teclado:

| Atajo | Descripción |
| --- | --- |
| `Ctrl` + `Shift` + `Q` | Finaliza la ejecución de Terminator |
| `Ctrl` + `Shift` + `W` | Cierra la terminal o la ventana activa |
| `Ctrl` + `Shift` + `I` | Abre una nueva ventana (la cual es parte del proceso actual de Terminator)
| `Ctrl` + `Shift` + `T` | Abre una nueva pestaña en el directorio actual |
| `Ctrl` + `Shift` + `O` | Divide la terminal horizontalmente |
| `Ctrl` + `Shift` + `E` | Divide la terminal horizontalmente |
| `Ctrl` + `Shift` + `→` | Modifica el tamaño de la terminal verticalmente |
| `Ctrl` + `Shift` + `←` | Modifica el tamaño de la terminal verticalmente |
| `Ctrl` + `Shift` + `↑` | Modifica el tamaño de la terminal horizontalmente |
| `Ctrl` + `Shift` + `↓` | Modifica el tamaño de la terminal horizontalmente |
| `Ctrl` + `Shift` + `S` | Oculta/Muestra la barra de scroll de la terminal activa |
| `Ctrl` + `Shift` + `F` | Muestra la barra de búsqueda |
| `Ctrl` + `Shift` + `N` | Cambia a la siguiente terminal en la misma pestaña |
| `Ctrl` + `Shift` + `P` | Cambia a la anterior terminal en la misma pestaña |
| `Ctrl` + `Shift` + `X` | Cambia entre mostrar todas las terminales o maximizar la actual |
| `Ctrl` + `Shift` + `Z` | Cambia entre mostrar todas las terminales o una visión ampliada de la actual (zoom) |
| `Ctrl` + `PageDown` | Cambia a la siguiente terminal |
| `Ctrl` + `PageUp` | Cambia a la terminal anterior |
| `Alt` + `→` | Cambia a la terminal justo a la derecha de la actual |
| `Alt` + `←` | Cambia a la terminal justo a la izquierda de la actual |
| `Alt` + `↑` | Cambia a la terminal justo encima de la actual |
| `Alt` + `↓` | Cambia a la terminal justo debajo de la actual |
| `Ctrl` + `Shift` + `C` | Copia el texto seleccionado a la clipboard |
| `Ctrl` + `Shift` + `V` | Pega el contenido de la clipboard a la terminal actual |
| `Ctrl` + `Plus` (+) | Aumenta el tamaño de la fuente para la terminal actual (es posible que debas presionar `Shift` dependiendo del teclado) |
| `Ctrl` + `Minus` (-) | Reduce el tamaño de la fuente para la terminal actual (es posible que debas presionar `Shift` dependiendo del teclado) |
| `Ctrl` + `Zero` (0) | Reinicia el tamaño de la fuente para la terminal actual (a los valores de configuración por defecto) |
| `F11` | Activa o desactiva la pantalla completa |
| `Ctrl` + `Shift` + `R` | Reinicia el estado de la terminal |
| `Ctrl` + `Shift` + `G` | Reinicia el estado de la terminal y limpia la pantalla |

# En proceso...
Próximamente intentaré publicar el proyecto con una configuración alternativa para su ejecución en usuarios con permisos limitados.

> ##### Si consideras útil este proyecto, apóyalo haciendo "★ Star" en el repositorio. ¡Gracias!

### Hack & Code 😎

[Volver al índice](#índice)