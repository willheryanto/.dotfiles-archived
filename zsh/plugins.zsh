### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
zinit light starship/starship

zinit wait lucid light-mode for \
    atload'_zsh_autosuggest_start' zsh-users/zsh-autosuggestions \
    atinit"zicompinit; zicdreplay" zdharma-continuum/fast-syntax-highlighting \
               zdharma-continuum/history-search-multi-word \
    light-mode rupa/z \
    light-mode OMZP::tmux \
    light-mode lukechilds/zsh-nvm
