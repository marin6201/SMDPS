#!/usr/bin/bash

pushd /data/openpilot

if [ -f /EON ]; then
  echo -n "0" > /data/params/d/PutPrebuilt
  rm -f prebuilt
elif [ -f /TICI ]; then
  echo -n "0" > /data/params/d/PutPrebuilt
  sudo rm -f prebuilt
fi

BRANCH=$(git rev-parse --abbrev-ref HEAD)
git fetch --all
REMOTE_HASH=$(git rev-parse --short --verify origin/$BRANCH)
echo ""
git reset --hard $REMOTE_HASH

echo ""
echo "  Git Fetch and Reset HEAD commit ..."
echo ""
echo "  current branch is [ $BRANCH ]  "
echo ""

exec /data/openpilot/scripts/restart.sh