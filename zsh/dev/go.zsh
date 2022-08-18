export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin # Go bin
export PATH=$PATH:$GOPATH/bin # Go bin
export GOENV_ROOT=$HOME/.goenv
export PATH=$PATH:$GOENV_ROOT/bin


# Minimal Go Env
export GOENV_SHELL=zsh
export GOENV_ROOT=/home/wh/.goenv
if [ "${PATH#*$GOENV_ROOT/shims}" = "${PATH}" ]; then
  export PATH="$GOENV_ROOT/shims:$PATH"
fi
