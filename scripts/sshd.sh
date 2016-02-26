#!/bin/bash -eux

[[ ! "$SSH" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

echo "UseDNS no" >> /etc/ssh/sshd_config
