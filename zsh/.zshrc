# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

export PATH=$PATH:/home/grondst/ADB\ Tools/platform-tools/
export BAT_THEME="gruvbox-dark"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode


# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found


# Set up FZF key bindings and fuzzy completion
# Keymaps for this is available at https://github.com/junegunn/fzf-git.sh
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ----- Vim Editings modes -----	
set -o vi

# ----- Completion styling -----
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ----- Aliases -----
alias ls="eza --long --header --color=always --icons=always --git"
alias la="eza --long --header --all --color=always --icons=always --git"
alias tree="eza --tree --level=3 --icons=always"
alias ff="fastfetch"
alias degradation_battery="echo \"Battery health: \$(echo \"(1 - \$(upower -i \$(upower -e | grep BAT) | awk '/energy-full:/ {ef=\$2} /energy-full-design:/ {efd=\$2} END {print ef/efd}')) * 100 + 0.5\" | bc | cut -d'.' -f1)%\""
alias update_kern="sudo mkinitcpio -P && sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias tmuxkill-ses="tmux kill-session -t"
alias tmuxa="tmux attach -t"
alias live='stat / | awk "/Birth/ {print \"Installed:\", \$2, \$3}" && echo "Today: $(date)" && echo "Life: $(( ($(date +%s) - $(stat / | awk "/Birth/ {print \$2, \$3}" | xargs -I{} date -d "{}" +%s)) / 86400 )) days"'
alias zed="zededitor"

# ----- Shell integrations -----
eval "$(fzf --zsh)"
eval "$(starship init zsh)"


# Load Angular CLI autocompletion.
source <(ng completion script)
