#!/usr/bin/env bash
set -euxo pipefail

# add line to load ~/.azdev/env.sh
if [ ! -f ~/.bashrc ] || ! fgrep '. ~/.azdev/env.sh' >/dev/null ~/.bashrc; then
    (
    echo
    echo '# load environment variables of Azure service principal'
    echo '. ~/.azdev/env.sh'
    ) >> ~/.bashrc
fi
