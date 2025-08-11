eval "$(rbenv init -)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"
source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eza Aliases
alias ls='eza --icons --group-directories-first --git'
alias la='eza -la'
alias ll='eza -l'
alias llf='eza -llf'
alias lt='eza -T'
alias lg='eza --git'
alias lf='ls | fzf'


# git Aliases
alias gc='git commit -m'
alias gco='git checkout'
alias gs='git status'
alias ga='git add .'
alias gp='git push'
alias gl='git log'
alias gr='git remote'
alias gls='git ls-files'
alias gb='git branch'


# Neovim Aliases
alias vim='nvim'
alias v='nvim'


# Standard Command Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd $HOME'
alias venv='source .venv/bin/activate'

export PATH="$HOME/go/bin:$PATH"

function chpwd() {
   if [[ -t 1 ]] eza --icons --group-directories-first --git
}
