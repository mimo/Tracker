#!/bin/sh

cd $(dirname $0)
source ./config

export ADA_PROJECT_PATH="$RAYLIB_ADA_PATH"

case $1 in
  clean)
    gprclean -P tracker.gpr;;
  edit)
    $EDITOR;;
  *)
    gprbuild -p -P tracker.gpr -XRAYLIB_PATH="$RAYLIB_PATH"
esac
