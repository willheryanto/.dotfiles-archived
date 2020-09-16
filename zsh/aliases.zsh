alias vim="nvim"
alias v="nvim"
alias vi="nvim"
alias ls="exa"

alias zshrc="cd $DOTFILES; vim .zshrc"
alias vimrc="cd $DOTFILES/neovim/.config/nvim; vim init.vim"

alias copy="tr -d '\n' | pbcopy"
alias pwdc="pwd | tr -d '\n' | pbcopy"
alias ".."="cd .."
alias "..."="cd ../.."
alias "...."="cd ../../.."
alias -- -="cd -"

alias lg="lazygit"

# Languages shortcut
alias n="node"
alias d="deno"
alias p="python"
alias nv="node -v"

# Mongohacker
alias mhon='mv ~/.mongorc.js.backup ~/.mongorc.js'
alias mhoff='mv ~/.mongorc.js ~/.mongorc.js.backup'

# ZSH files shortcut
alias aliasrc="cd $DOTFILES/zsh; vim aliases.zsh"

# pgcli
alias pgcli="pgcli --auto-vertical-output"

# Turn off accent typing
# defaults write -g ApplePressAndHoldEnabled -bool false

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

## FZF FUNCTIONS ##

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fo() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fh [FUZZY PATTERN] - Search in command history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fbr [FUZZY PATTERN] - Checkout specified branch
# Include remote branches, sorted by most recent commit and limited to 30
fgb() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
