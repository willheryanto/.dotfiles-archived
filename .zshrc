# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Basic ENV pre-run
export DOTFILES=$HOME/.dotfiles
export MYZSHCONFIG=$DOTFILES/zsh
export MYVIMCONFIG=$HOME/.config/nvim/
export NVM_LAZY_LOAD=true
export EDITOR=nvim

# PATH
export PATH=$PATH:$DOTFILES/bin # My own bin
export PATH=$PATH:$HOME/.pyenv/bin # pyenv
export PATH=$PATH:$HOME/.poetry/bin:$PATH # Poetry completion
export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin # Google Cloud SDK
export PATH=$PATH:/usr/local/mysql/bin # MySQL
export PATH="/usr/local/opt/llvm/bin:$PATH" # llvm for c++

# Plugin ENV
export FZF_DEFAULT_COMMAND='rg --files' # Setting rg as the default source for fzf

# For the sake of psycopg2
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Plugins
#zinit ice depth=1
#zinit light romkatv/powerlevel10k
zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
zinit light starship/starship

zinit wait lucid atload'_zsh_autosuggest_start' light-mode for \
    light-mode zsh-users/zsh-autosuggestions \
    light-mode zdharma/fast-syntax-highlighting \
               zdharma/history-search-multi-word \
    light-mode rupa/z \
    light-mode OMZ::plugins/git/git.plugin.zsh \
    light-mode OMZ::plugins/tmux/tmux.plugin.zsh \
    light-mode OMZ::plugins/pyenv/pyenv.plugin.zsh \
    light-mode lukechilds/zsh-nvm \
    #light-mode OMZ::plugins/vi-mode/vi-mode.plugin.zsh

source $MYZSHCONFIG/aliases.zsh
source $MYZSHCONFIG/keyremap.zsh
source $MYZSHCONFIG/xendit.zsh

#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
