#!/bin/bash -eux

[[ "$DOCKER" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

echo "==> Installing Docker..."
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list"
apt-get --yes update
apt-get --yes --ignore-missing --no-install-recommends install docker-engine
curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
