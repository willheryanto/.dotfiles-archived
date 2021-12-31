sources=(
    bins
    aliases
    keyremap
)

for source in $sources; do
    source $MYZSHCONFIG/defaults/$source.zsh
done

