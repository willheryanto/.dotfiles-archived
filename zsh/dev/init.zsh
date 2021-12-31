sources=(
    flutter
    go
    node
    perl
    python
    lua
)

for source in $sources; do
    source $MYZSHCONFIG/dev/$source.zsh
done
