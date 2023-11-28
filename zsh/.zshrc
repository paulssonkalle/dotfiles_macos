# history options
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# misc options
unsetopt beep
bindkey -e

# completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors '=*=34'

setopt PROMPT_SUBST
source /opt/homebrew/opt/zsh-git-prompt/zshrc.sh
source $DOTFILES/robbyrussel.zsh-theme


# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# aliases
source $DOTFILES/aliases

source $DOTFILES/git.zsh

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
eval "$(zoxide init zsh)"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# python
# export PATH="$HOMEBREW_PREFIX/opt/python@3.11/libexec/bin:$PATH"

typeset -U PATH