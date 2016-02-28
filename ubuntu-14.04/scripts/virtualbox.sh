#!/bin/bash -eux

[[ ! "$BUILD_SCRIPT_VIRTUALBOX" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "==> Installing VirtualBox Guest Additions..."
    mount -o loop /home/${SSH_USERNAME}/VBoxGuestAdditions.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    rm /home/${SSH_USERNAME}/{VBoxGuestAdditions.iso,.vbox_version}
fi
