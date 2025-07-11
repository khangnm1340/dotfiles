#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export _ZO_FZF_OPTS="--scheme=path --tiebreak=end,chunk,index --bind=ctrl-z:ignore,btab:up,tab:down --cycle --keep-right --border=sharp --height=45% --info=inline --layout=reverse --tabstop=1 --exit-0 --select-1"

eval "$(zoxide init bash)"

export MANPAGER="nvim +Man!"

export EDITOR='ghostty -e nvim'
export VISUAL='ghostty -e nvim'

function y() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
}
eval "$(starship init bash)"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"

# Alias uutils commands
for full_cmd in /usr/bin/uu-*; do
      uu_cmd=${full_cmd##*/} # Extracts uu-ls from /usr/bin/uu-ls
      cmd=${uu_cmd#uu-}      # Extracts ls from uu-ls
      # Avoid aliasing special commands like '[' if you don't want to
      if [[ "$cmd" != "[" ]]; then
            alias "$cmd"="$full_cmd"
      fi
done
source ~/builds/RedditArchiver-standalone/reddit-archive.sh
