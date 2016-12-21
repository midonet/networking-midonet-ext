#! /bin/sh

set -e

DIR=$(dirname $0)
${DIR}/tox_install_project.sh neutron-lbaas neutron_lbaas $*

CONSTRAINTS_FILE=$1
shift

install_cmd="pip install"
if [ $CONSTRAINTS_FILE != "unconstrained" ]; then
    install_cmd="$install_cmd -c$CONSTRAINTS_FILE"
fi

$install_cmd -U $*
