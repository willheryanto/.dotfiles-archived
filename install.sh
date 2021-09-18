#!/bin/bash

# Ensure you're in $HOME
cd $HOME

check_cmd() {
	if ! command -v "$1" &>/dev/null; then
		shift
		eval "$@"
	else
		echo "$1 already installed."
	fi
}

check_brew() {
	case $1 in
	-c | --cask)
		shift
		if ! brew list --cask $1 &>/dev/null; then
			brew install --cask $@
		else
			echo "Cask ${@: -1} already installed."
		fi
		;;
	*)
		if ! brew list $1 &>/dev/null; then
			brew install $@
		else
			echo "Formula ${@: -1} already installed."
		fi
		;;
	esac
}

# Homebrew
check_cmd brew /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Karabiner
echo "karabiner-elements"
check_cmd brew /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
check_brew -c karabiner-elements

## https://github.com/Vonng/Capslock
open -a Safari 'karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/Vonng/Capslock/master/mac_v3/capslock.json'

# iTerm2
check_brew -c iterm2

# https://github.com/zdharma/zinit
check_brew zinit

# Programming languages

## Python
check_brew xz
check_brew readline
check_brew pyenv
eval "$(pyenv init --path)"
pyenv install 3.9.7
pyenv global 3.9.7
pip install isort black neovim yamllint sqlparse jedi-language-server jupyterlab jupyterlab_vim

## Node
check_cmd nvm curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 16.9.0
npm i -g neovim typescript typescript-language-server @fsouza/prettierd eslint_d bash-language-server yarn env-cmd diagnostic-languageserver
yarn global add yaml-language-server
check_brew efm-langserver

## Go
check_brew go
check_cmd shfmt GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt

## C++
check_brew llvm

## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## Helpers
check_brew fzf
check_brew rg
check_brew fd
check_brew exa
check_brew xsv
check_brew jq
check_brew ctags
check_brew pdm
check_brew pipx
check_brew -c rectangle
check_brew -c alfred

# Tmux
check_brew tmux
cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Neovim
check_brew --head neovim

## Dotfiles
check_brew stow

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir $HOME/.dotfiles
git clone https://github.com/willheryanto/.dotfiles $HOME/.dotfiles

cd $HOME/.dotfiles
stow neovim
rm $HOME/.zshrc
ln -v .zshrc $HOME/.zshrc

# Programming languages helper #2
mkdir $HOME/dev $HOME/dev/repos $HOME/dev/repos/ext $HOME/dev/repos/ext/language-servers

## Lua
check_brew ninja

### https://github.com/Koihik/LuaFormatter
cd $HOME/dev/repos/ext
git clone --recurse-submodules https://github.com/Koihik/LuaFormatter.git
cd LuaFormatter
cmake .
make
make install
cp lua-formatter $HOME/.dotfiles/bin/

### https://github.com/sumneko/lua-language-server
### The LSP execute from this folder directly
cd $HOME/dev/repos/ext/language-servers
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

## Latex
### The LSP execute from this folder directly
cd $HOME/dev/repos/ext/language-servers
git clone https://github.com/latex-lsp/texlab
cd texlab && cargo build --release

## C++
check_brew gcc
cd $HOME/dev/repos/ext
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
LLVM_VERSION=$(brew list --versions llvm | awk '{print $2}')
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/local/Cellar/llvm/$LLVM_VERSION/lib/cmake
cmake --build Release
cp Release/ccls /usr/local/bin/

# Neovim execute
nvim -c :PackerInstall

# Databases
brew tap mongodb/brew
check_brew mongodb-community@5.0
brew services start mongodb/brew/mongodb-community

check_brew postgresql
brew services start postgresql

check_brew -c dbeaver-community
