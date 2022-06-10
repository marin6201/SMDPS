#!/usr/bin/bash

cd /data/openpilot

pkill -2 -f boardd

python ./selfdrive/debug/clear_dtc.py

sleep 10

# Allows you to restart OpenPilot without rebooting the Comma 3
tmux kill-session -t comma;
rm -f /tmp/safe_staging_overlay.lock;
tmux new -s comma -d "/data/openpilot/launch_openpilot.sh"