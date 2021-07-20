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
export EDITOR=nvim
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export NVM_LAZY_LOAD=true

# PATH
export PATH=$PATH:$DOTFILES/bin # My own bin
export PATH=$PATH:$HOME/.nvm/versions/node/v14.5.0/bin # trick to boost NVM load time
export PATH=$PATH:$HOME/.pyenv/bin # pyenv
export PATH=$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin # Google Cloud SDK
export PATH=$PATH:$GOROOT/bin # Go bin
export PATH=$PATH:$GOPATH/bin # Go bin
export PATH=$PATH:/usr/local/Cellar/llvm/11.0.0_1/bin # llvm
export PATH=$PATH:/usr/local/Cellar/llvm/11.0.0_1/bin # llvm
export PTPYTHON_CONFIG_HOME=$HOME/.config/ptpython

# Plugin ENV
export FZF_DEFAULT_COMMAND='rg --files' # Setting rg as the default source for fzf

# PHP
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# zlib
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
    light-mode OMZP::pyenv \
    light-mode lukechilds/zsh-nvm \

files=(
    $MYZSHCONFIG/aliases.zsh
    $MYZSHCONFIG/keyremap.zsh
    $MYZSHCONFIG/xendit.zsh
)

for file in $files; do
    source $file
done
