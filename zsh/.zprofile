export LANG=en_US.UTF-8
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/dev"

# zsh
export HISTFILE="$HOME/.zsh_history"    # History filepath
export HISTSIZE=10000000                # Maximum events for internal history
export SAVEHIST=10000000                # Maximum events in history file


# editor
export EDITOR="nvim"
export VISUAL="nvim"
# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --exclude .git --ignore-file $DOTFILES/.fd_ignore . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden --exclude .git --ignore-file $DOTFILES/.fd_ignore -t d . $HOME"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#24273a,bg:#24273a,spinner:#a6da95,hl:#eed49f \
--color=fg:#cad3f5,header:#ed8796,info:#ed8796,pointer:#a6da95 \
--color=marker:#a6da95,fg+:#cad3f5,prompt:#a6da95,hl+:#eed49f"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#A5ADCB"

# zvm
ZVM_VI_SURROUND_BINDKEY=s-prefix

# path
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/usr/local/bin"

# fpath
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
