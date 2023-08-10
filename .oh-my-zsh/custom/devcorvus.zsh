# SCRIPTS

source /usr/share/nvm/init-nvm.sh

# ALIASES
alias wd='cd ~/Dev/code/projects'
alias edit:zsh='nvim ~/.oh-my-zsh/custom/devcorvus.zsh'
alias edit:nvim='nvim ~/.config/nvim'
alias edit:hosts='sudo nvim /etc/hosts'
alias pacman:clear='sudo pacman -Rns $(pacman -Qtdq)'
alias pacman:cache='paccache -r --keep 2'
# tmux
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
