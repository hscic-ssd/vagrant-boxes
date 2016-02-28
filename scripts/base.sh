#!/bin/bash -eux

[[ ! "$BUILD_SCRIPT_BASE" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

echo "==> Updating OS..."
apt-get update
apt-get --yes upgrade

echo "==> Giving ${SSH_USERNAME} sudo powers..."
echo "${SSH_USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "==> Fixing stdin not being a TTY..."
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

echo "==> Configuring SSH..."
echo "UseDNS no" >> /etc/ssh/sshd_config
