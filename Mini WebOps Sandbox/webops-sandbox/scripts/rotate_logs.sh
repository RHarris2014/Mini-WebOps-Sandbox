#!/usr/bin/env bash
set -e
LOGDIR="./logs"
mkdir -p "$LOGDIR"
STAMP=$(date +%Y%m%d-%H%M%S)
[ -f "$LOGDIR/access.log" ] && mv "$LOGDIR/access.log" "$LOGDIR/access.$STAMP.log"
[ -f "$LOGDIR/error.log"  ] && mv "$LOGDIR/error.log"  "$LOGDIR/error.$STAMP.log"
echo "logs rotated $STAMP"