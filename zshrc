export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/nvim/bin:$PATH"

eval "$(starship init zsh)"

alias ls="ls -C -t -U -A -p --color=auto" 
alias sl="ls -C -t -U -A -p --color=auto" 
alias vi="nvim"

alias act="source venv/bin/activate"

alias conf="nvim ~/.config/nvim/init.lua"

[ -z "$TMUX" ] && { tmux attach || exec tmux new-session;  }
