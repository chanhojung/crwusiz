#!/usr/bin/env sh
set -e
pushd /data/openpilot/panda/board

scons -u -j$(nproc)
printf %b 'from python import Panda\nfor serial in Panda.list(): Panda(serial).flash()' | PYTHONPATH=.. python3

sleep 5

exec /data/openpilot/scripts/restart.sh