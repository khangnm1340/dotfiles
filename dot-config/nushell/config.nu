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
        mode: compact # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    }

    keybindings: [
      {
            name: quick_cd
            modifier: shift
            keycode: char_z
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "nvim (fzf --preview 'bat --style=numbers --color=always {}')" }
      }
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
      {
            name: reload_config
            modifier: control
            keycode: char_x
            mode: [emacs vi_normal vi_insert]
            event: { send: executehostcommand, cmd: $"source \'($nu.env-path)\';source \'($nu.config-path)\'" }
      }
      {
            name: fzf_file
            modifier: control
            keycode: char_f
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "commandline edit $'(commandline | str trim --right) \"(fd -I | fzf)\"'" }
      }
      {
            name: fzf_history
            modifier: Control_Shift
            keycode: char_o
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "password" 
            }
      }
      {
            name: fzf_history
            modifier: Control_Alt
            keycode: char_r
            mode: [emacs vi_normal vi_insert]
            event: { 
                  send: executehostcommand,
                  cmd: "commandline edit ( history | uniq |  reverse | get command | str join $'(char nul)' | fzf --read0 --gap -q (commandline))" 
            }
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
      {
            name: delete_to_beginning_vi_insert
            modifier: control
            keycode: char_u
            mode: [vi_normal vi_insert]
            event: { edit: CutFromStart }
      }
    {
      name: "multi_line_newline"
      modifier: shift
      keycode: char_j
      mode: ["emacs", "vi_insert"]
      event: { edit: InsertNewline }
    }
	  
    ]
}

def pick-app [] {
cd /usr/share/applications
  let choice = (
    ^ls
    | fzf --reverse
  )
  job spawn { gtk-launch $choice }
}

def password [] {
  let sel = (fd -t f . /home/pampam/.password-store | fzf | str trim)

  # If fzf was cancelled or nothing chosen -> do nothing
  if ($sel | is-empty) {
    return
  }

  pass show (
    $sel
    | path relative-to '/home/pampam/.password-store/'
    | str replace --regex '\.gpg$' ''
  ) | wl-copy
}

def count-files [--sum(-s)] {
  let dirs = (
      ls -a
      | where type == dir
      | insert file_count {|row|
          fd -HI --type f . $row.name
          | lines
          | length
      }
      | sort-by file_count
  )

  if $sum {
      $dirs | get file_count | math sum
  } else {
      $dirs
  }
}


use ~/.cache/starship/init.nu
use std/dirs
use std formats *
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	uwsm-app -- yazi ...$args --cwd-file $tmp
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

def zotify-album [album_link: string] {

let CLIENT_ID = "f70a171502544b9ba9b701a0c7e1a04c"
let CLIENT_SECRET = "ce619d57d54f425aacdb1bd376a76279"

let TOKEN = (curl -s -u $"($CLIENT_ID):($CLIENT_SECRET)" -d grant_type=client_credentials https://accounts.spotify.com/api/token | from json | get access_token)

let ALBUM_ID = ( $album_link | split row "?" | get 0 | split row "/" | last)
mut all = []
mut url = $"https://api.spotify.com/v1/albums/($ALBUM_ID)/tracks?limit=50" 
while $url != null {
let uris = (http get -H {Authorization: $"Bearer ($TOKEN)"} $url)

  let items = ($uris.items.uri)
  # append items to all
  $all = ($all ++ $items)
  $url = $uris.next
}

zotify ...$all
}



const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
  ...$NU_PLUGIN_DIRS
]

# alias zd = zellij action new-pane -d down
# alias cl = clear
# alias jkl = yt-dlp -f bestvideo+bestaudio --embed-subs --sub-langs "en" --merge-output-format mp4 --remote-components ejs:github
alias jkl = yt-dlp -f bestvideo+bestaudio --embed-subs --sub-langs "en" --remote-components ejs:github
# alias jkh = yt-dlp -f "bestvideo[height<=?1080]+bestaudio" --embed-subs --sub-langs "en" --merge-output-format mp4 
alias jkh = yt-dlp -f "bestvideo[height<=?1080]+bestaudio" --embed-subs --sub-langs "en" --remote-components ejs:github
alias gl = gallery-dl
alias wk = gallery-dl -D .
alias sudo = sudo-rs
alias su = su-rs
alias grep = rg
alias lsa = eza -alh --group-directories-first --icons=auto
alias lta = eza -a --tree --level=2 --long --icons --git
# alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias k = cd (cat ~/.config/nushell/cd_history.txt | fzf)
alias wg2 = wget2 -m -p -E -k -np --no-robots
# alias wpe = wget2 -p -E
alias nvim = uwsm-app -- nvim
alias n = uwsm-app -t service  -- neovide
alias w = wget2
alias ff = fastfetch
alias nhentai = ~/builds/nhentai/nhentai
# alias peak = tmux new-session -s peak bash
alias peak = bash -c "paste <(jack_meter -n -f 10 'Easy Effects Sink:monitor_FL') <(jack_meter -n -f 10 'Easy Effects Sink:monitor_FR')"


alias f = plocate -i
alias codex = uwsm-app -- codex
alias jl = jupyter lab


# source ~/dotfiles/pamsdots/dot-config/nushell/nu_scripts/themes/nu-themes/github-light-default.nu
source $"($nu.config-path | path dirname)/custom_scripts/uutils_alias.nu"
source $"($nu.config-path | path dirname)/custom_scripts/polars_alias.nu"
source ~/.zoxide.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.local/share/atuin/init.nu
use ~/.config/broot/launcher/nushell/br *
