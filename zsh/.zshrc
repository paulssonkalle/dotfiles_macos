# history options
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# misc options
unsetopt beep
bindkey -e


# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors '=*=34'

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{green}${vcs_info_msg_0_}%f
$ '


# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# aliases
source $DOTFILES/aliases

# plugins
_zsh_autosuggest_strategy_histdb_top() {
    local query="
        select commands.argv from history
        left join commands on history.command_id = commands.rowid
        left join places on history.place_id = places.rowid
        where commands.argv LIKE '$(sql_escape $1)%'
        group by commands.argv, places.dir
        order by places.dir != '$(sql_escape $PWD)', count(*) desc
        limit 1
    "
    suggestion=$(_histdb_query "$query")
}
ZSH_AUTOSUGGEST_STRATEGY=histdb_top
HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g') # needed on macos for zsh-histdb
source $HOME/.zsh/zsh-histdb/sqlite-history.zsh

function init_after_vim_mode_plugin() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  source $HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  zle -N fzf-cd-widget
  bindkey -M emacs '\C-w' fzf-cd-widget
  bindkey -M vicmd '\C-w' fzf-cd-widget
  bindkey -M viins '\C-w' fzf-cd-widget
}
zvm_after_init_commands+=(init_after_vim_mode_plugin)

source $HOMEBREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
autoload -Uz add-zsh-hook
eval "$(zoxide init zsh)"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
