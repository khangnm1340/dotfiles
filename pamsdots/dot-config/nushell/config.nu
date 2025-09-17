# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
$env.config = {

    edit_mode: vi # emacs, vi
    table: {
        mode: basic # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    }

    keybindings: [
      {
            name: quick_cd
            modifier: alt
            keycode: char_k
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "cd (cat ~/.config/nushell/cd_history.txt | fzf)" }
      }
			{
            name: last_cd
            modifier: shift
            keycode: char_l
            mode: [emacs vi_normal vi_insert]
            event: { send: executehostcommand, cmd: "cd -" }
      }
        # {
        #     name: shpool_switch
        #     modifier: control
        #     keycode: char_h
        #     mode: [emacs vi_normal vi_insert]
        #     event: { 
        #         send: executehostcommand,
        #         cmd: "
        #             shpool attach ( [1_hanni 2_dani 3_minji 4_haerin 5_hyein] | str join (char nl) | fzf)
        #         "
        #     }
        # }
      {
            name: reload_config
            modifier: control
            keycode: char_x
            mode: [emacs vi_normal vi_insert]
            event: { send: executehostcommand, cmd: $"source \'($nu.env-path)\';source \'($nu.config-path)\'" }
      }
    # {
    #   name: copy_pwd
    #   modifier: control_shift
    #   keycode: char_z
    #   mode: [emacs vi_normal vi_insert]
    #   event: {
    #     send: executehostcommand,
    #     cmd: "
    #       if $env.WAYLAND_DISPLAY? != null {
    #         pwd | wl-copy
    #         pwd | notify -i /home/Ext4Pam/Pictures/NewjeansPics/GX2MHKzaYAEAhg_.jpg -s 'copied current directory' -t $in
    #       } else {
    #         pwd | notify -i /home/Ext4Pam/Pictures/NewjeansPics/GX2MHKzaYAEAhg_.jpg -s 'cant copy current directory' -t $in
    #       }
    #     "
    #   }
    # }
      {
            name: fzf_file
            modifier: control
            keycode: char_f
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "commandline edit $'(commandline | str trim --right) \"(fd -d 1 | fzf)\"'" }
      }
      {
            name: fzf_history
            modifier: control
            keycode: char_r
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "commandline edit ( history | select command | uniq | get command | to text | fzf -q (commandline))" }
      }
      {
            name: yazi
            modifier: alt
            keycode: char_j
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "y" }
      }
	  
    ]
}
# Show "shpool:<name> " when inside a shpool session
# let sess_prefix = if 'SHPOOL_SESSION_NAME' in ($env | columns) {
#   $"(ansi green)shpool:($env.SHPOOL_SESSION_NAME)(ansi reset) "
# } else { "" }
#
# $env.PROMPT_COMMAND = {||
#   $"($sess_prefix)($env.PWD) > "
# }
use ~/.cache/starship/init.nu
use std/dirs
use std formats *

def str-wrap [
  --wrap-at: number = 40
] {
  str replace -a "\r\n" "\n"
    | str replace -a "\n" " SINGLENEWLINE "
    | str trim
    | split row -r "\\s+"
    | reduce -f { joined: '' count: 0 } { |word, state|
        if ($word == "\n") {
          {
            joined: ($state.joined + "\n")
            count: 0
          }
        } else if ($state.count < $wrap_at) {
          if ($state.joined | is-empty) {
            {
              joined: $word
              count: ($word | str length)
            }
          } else {
            {
              joined: ($state.joined + ' ' + $word)
              count: ($state.count + 1 + ($word | str length))
            }
          }
        } else {
          {
            joined: ($state.joined + "\n" + $word)
            count: 0
          }
        }
      }
    | get joined
    | str replace -ar "\\s*SINGLENEWLINE\\s*" "\n"
}

def "wrap" [column_name: string] {
    update $"($column_name)" { str-wrap } | table -ed 1
}

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

def "notify on done" [
    task: closure
] {
    let start = date now
    let result = do $task
    let end = date now
    let total = $end - $start | format duration sec
    let body = $"Task completed in ($total)"
    notify -s "Task Finished" -t $body
    return $result
}



const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
  ...$NU_PLUGIN_DIRS
]

# alias zd = zellij action new-pane -d down
# alias cl = clear
alias jkl = yt-dlp -f bestvideo+bestaudio --embed-subs --sub-langs "en" --merge-output-format mp4
alias jkh = yt-dlp -f "bestvideo[height<=?1080]+bestaudio" --embed-subs --sub-langs "en" --merge-output-format mp4
alias gl = gallery-dl
alias wk = gallery-dl -D .
alias sudo = sudo-rs
alias su = su-rs
alias grep = rg
alias lsa = eza -l --icons --time-style=long-iso --group-directories-first
alias k = cd (cat ~/.config/nushell/cd_history.txt | fzf)
alias wg2 = wget2 -m -p -E -k -np --no-robots
# alias wpe = wget2 -p -E
alias vim = nvim
alias w = wget2
# alias sam = shpool attach main
# alias sa = shpool attach
# alias sk = shpool kill
# alias sl = shpool list
# alias s = shpool
alias n = /home/pampam/builds/nhentai/nhentai

alias jl = jupyter lab


# source /home/pampam/dotfiles/pamsdots/dot-config/nushell/nu_scripts/themes/nu-themes/github-light-default.nu
source $"($nu.config-path | path dirname)/custom_scripts/uutils_alias.nu"
source ~/.zoxide.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
