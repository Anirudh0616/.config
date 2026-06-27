autoload -U colors && colors
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/nvim/bin:$PATH"
export FZF_DEFAULT_OPTS='--color=fg:#8085a6,bg:#222433,hl:#bdc3e6,fg+:#8085a6,bg+:#363e7f,hl+:#bdc3e6,info:#929be5 --color=prompt:#32364c,pointer:#b871b8,marker:#b871b8,spinner:#73c1a9,header:#32364c,border:#32364c,gutter:-1'


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

alias ls="ls -C -t -U -A -p --color=auto" 
alias sl="ls -C -t -U -A -p --color=auto" 
alias vi="nvim"

alias act="source venv/bin/activate"

alias conf="nvim ~/.config/nvim/init.lua"

[ -z "$TMUX" ] && { tmux attach || exec tmux new-session;  }


