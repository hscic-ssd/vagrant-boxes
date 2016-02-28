#!/bin/bash -eux

[[ ! "$BUILD_SCRIPT_CLEANUP" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

echo "==> Cleaning up APT packages..."
apt-get --yes autoremove --purge
apt-get --yes autoclean
apt-get --yes clean
find /var/lib/apt -type f | xargs rm -f
