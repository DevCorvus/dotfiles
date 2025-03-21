# ALIASES
alias edit:zsh='nvim ~/.oh-my-zsh/custom/devcorvus.zsh'
alias edit:nvim='nvim ~/.config/nvim'
alias edit:hosts='sudo nvim /etc/hosts'
alias pacman:list='pacman -Qi | egrep "^(Name|Installed)" | cut -f2 -d":" | paste - - | column -t | sort -nrk 2 | grep MiB | less'
alias pacman:clear='sudo pacman -Rns $(pacman -Qtdq)'
alias pacman:cache='paccache -r --keep 2'
# tmux
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
