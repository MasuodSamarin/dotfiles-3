#!/bin/bash
#                                                          -*- shell-script -*-
#
####
##
## Boseji's DigitalOcean Node Assignment Tool
##
## SPDX-License-Identifier: GPL-2.0-only
##
## Copyright (C) 2020 Abhijit Bose <boseji@users.noreply.github.com>
##
####
if [[ -z "$(which doctl)" ]] ; then
echo " Digitial Ocean CLI tool not found !"
echo
echo "  Please install the tool first from:"
echo "  https://github.com/digitalocean/doctl/releases"
exit 1
fi

if [ "$1" == "-h" -o "$1" == "--help" ] ; then
echo "Boseji's DigitalOcean Node Assignment Tool"
echo
echo "Usage :"
echo
echo "  digitalocean.sh <SSH-FILE> <ENV-FILENAME>"
echo
echo " Where:"
echo "  <SSH-FILE> = Path to SSH credential file used for login."
echo "                 (default value) ~/.ssh/id_rsa"
echo
echo " <ENV-FILENAME> = Environment Setup file Name"
echo "                 (default value) 'digitalocean.env'"
echo
echo
exit
fi

set -e

SSHFILE=${1:-"~/ssh/id_rsa"}
FILENAME=${2:-"digitalocean.env"}

echo '#!/bin/bash' > ${FILENAME}

doctl compute droplet list --format PublicIPv4 \
    | grep -v Public | cat -n \
    | sed -r "s/^\s+//g" \
    | sed 's#^[0-9]*#export NODE&=" -i '"${SSHFILE}"' root@#g' \
    | sed "s/\t//g" \
    | sed "s/$/\"/g" >> ${FILENAME} \
    && echo "Environment update file created at $(pwd)/${FILENAME}" \
    && echo \
    && echo "Execute the command :" && echo && echo \
    && echo "    $   source $(pwd)/${FILENAME}" && echo && echo \
    && echo "  to complete the setup." && echo && echo \
    && echo " Here is the '${FILENAME}' file: " && echo && echo \
    && cat ${FILENAME} && echo

