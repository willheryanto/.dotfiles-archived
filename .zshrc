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

# ENVs
export DOTFILES=$HOME/.dotfiles
export MYZSHCONFIG=$DOTFILES/zsh
export MYVIMCONFIG=$HOME/.config/nvim/
export EDITOR=nvim
export FZF_DEFAULT_COMMAND="rg --files" # Setting rg as the default source for fzf

# Flags
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/luajit-openresty/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/openssl/include -I/usr/local/opt/luajit-openresty/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# Plugins
zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
zinit light starship/starship

zinit wait lucid atload'_zsh_autosuggest_start' light-mode for \
    light-mode zsh-users/zsh-autosuggestions \
    light-mode zdharma/fast-syntax-highlighting \
               zdharma/history-search-multi-word \
    light-mode rupa/z \
    light-mode OMZL::git.zsh \
    light-mode OMZP::git \
    light-mode OMZP::tmux \
    light-mode lukechilds/zsh-nvm

files=(
    $MYZSHCONFIG/plgs/node.zsh
    $MYZSHCONFIG/plgs/python.zsh
    $MYZSHCONFIG/plgs/go.zsh
    $MYZSHCONFIG/bins.zsh
    $MYZSHCONFIG/aliases.zsh
    $MYZSHCONFIG/keyremap.zsh
)

for file in $files; do source $file; done
