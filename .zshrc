# ZSH settings
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=2000
export SAVEHIST=2000

# ENVs
export DOTFILES=$HOME/.dotfiles
export MYZSHCONFIG=$DOTFILES/zsh
export MYVIMCONFIG=$HOME/.config/nvim/
export EDITOR=nvim
export FZF_DEFAULT_COMMAND="rg --files" # Setting rg as the default source for fzf

# Plugins
source $MYZSHCONFIG/plugins.zsh

files=(
    defaults/init.zsh
    dev/init.zsh
    os/init.zsh
    work/init.zsh
)

for file in $files;
    do source $MYZSHCONFIG/$file;
done

. $HOME/.asdf/asdf.sh
