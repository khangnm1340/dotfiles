# Pam's Dotfiles 🦦

A collection of my personal configuration files for various applications. These are the settings I use for my Arch Linux Enviroment

## About This Repository

These dotfiles customize my development and desktop environment, which includes configurations for:

-   **Window Manager:** Hyprland
-   **Terminals:**  Ghostty
-   **Shells:** Bash, Fish, Nushell
-   **Editors:** Neovim, Zed, Neovide
-   **Status Bar:** Waybar
-   And many other tools.

The configurations are managed using [GNU Stow](https://www.gnu.org/software/stow/), which creates symlinks from this repository to the correct locations in the home directory.

## Installation

### 1. Prerequisites

-   You must have [GNU Stow](https://www.gnu.org/software/stow/) installed.
-   For the terminal and status bar to look best, it's recommended to install a [Nerd Font](https://www.nerdfonts.com/).

### 2. Setup Instructions

1.  **Navigate to your home directory**:
    ```bash
    cd ~

2.  **Clone the repository into your home directory** :
    ```bash
    git clone https://github.com/khangnm1340/dotfiles.git
    ```

    *(You can update this with the actual URL of your repository if you host it online.)*


3.  **Run Stow to create the symlinks**:
    The command will link the configuration files from the `pamsdots` directory to your home directory.
    ```bash
    stow --dotfiles -d dotfiles/ -t . pamsdots
    ```

## Contributing

This is a personal repository, but feel free to get inspired. If you see an issue or have a suggestion, you can open an issue.

---
*Generated with a little help from Gemini.*
