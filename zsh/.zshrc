# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Prompt
PROMPT='%F{cyan}%n@%m%f:%F{blue}%~%f %# '

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias cl='clear'

alias switch='sudo nixos-rebuild switch'
alias update='sudo nixos-rebuild switch --update'
alias nix='sudo nano /etc/nixos/configuration.nix'
alias niriconf='code ~/.config/niri/config.kdl'
alias fast='fastfetch'
alias zrc='code ~/.zshrc'
alias nir='niri-session'
alias suspend='systemctl suspend'
alias gitc='cd /etc/nixos'

alias pwn='ssh -i ~/.ssh/pwn_college_key hacker@dojo.pwn.college'
alias spice='spicetify backup apply'

# Default editor
export EDITOR=code
export VISUAL=code

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Tab accepts autosuggestion
bindkey '^I' autosuggest-accept

# Startup
fastfetch

export PATH=$PATH:/home/yoavs/.spicetify
