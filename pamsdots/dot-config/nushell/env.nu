# env.nu
#
# Installed by:
# version = "0.106.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]
use std "path add"
path add /home/pampam/go/bin
path add /home/pampam/.cargo/bin/
path add /home/pampam/.local/bin
path add /home/pampam/.local/share/nvim/mason/bin
path add /home/pampam/.dotnet/tools
path add /home/pampam/dotfiles/pamsdots/dot-config/nushell/nupm/plugins/bin
path add /usr/bin/vendor_perl
$env._ZO_ECHO = 1
zoxide init nushell | save -f ~/.zoxide.nu
$env.FZF_DEFAULT_COMMAND = 'fd --type f'
$env.EDITOR = 'nvim'
$env.JUPYTERLAB_DIR = ($env.HOME)/.local/share/jupyter/lab
$env.LS_COLORS = (vivid generate tokyonight-night)
$env.NVIM_APPNAME = "nvim-hanni"
$env.EMMYLUALS_CONFIG = ($env.HOME)/.config/nvim-hanni/.emmyrc.json

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

#~/.config/nushell/config.nu
source ~/.cache/carapace/init.nu
