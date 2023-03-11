#!/usr/bin/env bash
set -euxo pipefail

# add line to load ~/.azdev/env.sh
if [ ! -f ~/.zshrc ] || ! fgrep '. ~/.azdev/env.sh' >/dev/null ~/.zshrc; then
    (
    echo
    echo '# load environment variables of Azure service principal'
    echo '. ~/.azdev/env.sh'
    ) >> ~/.zshrc
fi
