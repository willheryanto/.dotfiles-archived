export NODE_VERSION=$(ls ~/.nvm/versions/node/ | tail -n 1 | sed 's/.*\(v[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}\).*/\1/g')
export PATH=$PATH:$HOME/.nvm/versions/node/$NODE_VERSION/bin # trick to boost NVM load time
