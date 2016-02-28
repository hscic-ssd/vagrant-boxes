#!/bin/bash -eux

[[ ! "$BUILD_SCRIPT_ZERODISK" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

echo "==> Clearing empty disk space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
