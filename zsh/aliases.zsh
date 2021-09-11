# Editors alises
alias vim="nvim"
alias v="nvim"
alias vi="nvim"

# cd aliases
alias zshrc="cd $DOTFILES; vim .zshrc"
alias vimrc="cd $DOTFILES/neovim/.config/nvim; vim init.vim"
alias luarc="cd $DOTFILES/neovim/.config/nvim; vim init.lua"
alias aliasrc="cd $DOTFILES/zsh; vim aliases.zsh"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias -- -="cd -"
alias md="cd $HOME/.dotfiles"

# PLG aliases
alias n="node"
alias p="python"
alias nv="node -v"

# Turn off accent typing
#defaults write -g ApplePressAndHoldEnabled -bool false

# Random
alias bm="benchmark"
alias ez="exec zsh"

# Utils
alias o="open"
alias t="touch"
alias ls="exa"
#alias db="defaultbrowser"
alias copy="tr -d '\n' | pbcopy"
alias pwdc="pwd | tr -d '\n' | pbcopy"

cdc() {
  cd "$(pbpaste)"
}

# Make new directory and directly cd into it
mcd() {
  mkdir $1 && cd $1
}

# Check zsh startup time
benchmark() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

# FZF functions
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --type f .
}

## Open file fuzzy
fo() {
  local files
  IFS=$'\n'
  files=($(_fzf_compgen_path | fzf-tmux --query="$1" --border --info=inline --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

## Open command history fuzzy
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

## Open git branch fuzzy
fgb() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
