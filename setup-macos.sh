# install required software
brew install azure-cli jq

# log in to Azure
az login

# create new sp
curl https://raw.githubusercontent.com/hiryamada/create-sp/main/create-sp.sh |bash

# load service principal environment variables in .bashrc
curl https://raw.githubusercontent.com/hiryamada/create-sp/main/load-env-in-bashrc.sh |bash

# load service principal environment variables in .zshrc
curl https://raw.githubusercontent.com/hiryamada/create-sp/main/load-env-in-zshrc.sh |bash
