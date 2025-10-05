#copy of my zshrc
export PATH="/opt/homebrew/bin:$PATH"

eval "$(starship init zsh)"

alias vim=nvim
alias vi=nvim
alias im=nvim
alias ls="ls -C -t -U -A -p --color=auto" 
alias sl="ls -C -t -U -A -p --color=auto" 

alias act="source venv/bin/activate"

alias conf="nvim ~/.config/nvim/init.lua"

