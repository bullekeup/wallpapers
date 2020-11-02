#!/bin/sh

SCRIPT_DIR="$(dirname $0)"
RUNDIR="$(pwd)"
cd ${SCRIPT_DIR}

FORCE_INSTALL=0;
while [ $# -gt 0 ]; do
  case $1 in
    --update | -u | --force ) FORCE_INSTALL=1; shift;;
    * ) shift;;
  esac
done

if [ ${FORCE_INSTALL} -eq 1 ] || [ ! -e "${HOME}/.local/share/wallpapers" ]; then
  [ -e "${HOME}/.config/polybar" ] && rm -Rf "${HOME}/.local/share/wallpapers"
  install -d "${HOME}/.local/share/wallpapers"
  install -m644 ./*.jpg "${HOME}/.local/share/wallpapers/"
fi

cd ${RUNDIR}

