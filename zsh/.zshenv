export LANG=en_US.UTF-8
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/dev"
# zsh
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=100000
# editor
export EDITOR="nvim"
export VISUAL="nvim"
# fzf
bindkey "ç" fzf-cd-widget
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git --ignore-file $DOTFILES/.fd_ignore . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden --exclude .git --ignore-file $DOTFILES/.fd_ignore -t d . $HOME"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#24273a,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# zvm
ZVM_VI_SURROUND_BINDKEY=s-prefix

# path
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/usr/local/bin"
