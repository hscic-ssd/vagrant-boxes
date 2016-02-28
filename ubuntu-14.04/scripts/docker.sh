#!/bin/bash -eux

[[ ! "$BUILD_SCRIPT_DOCKER" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]] && exit

echo "==> Installing Docker..."
os_pseudo_name=$(cat /etc/lsb-release | grep '^DISTRIB_CODENAME' | awk -F=  '{ print $2 }')
apt-key adv \
    --keyserver hkp://p80.pool.sks-keyservers.net:80 \
    --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-$os_pseudo_name main' > /etc/apt/sources.list.d/docker.list"
apt-get --yes update
apt-get --yes --ignore-missing --no-install-recommends install \
    docker-engine

echo "==> Installing Docker Compose..."
docker_compose_ver=$(curl -sSL https://github.com/docker/compose | grep '/docker/compose/tree/' | egrep '/[0-9]+\.[0-9+]\.[0-9]+"' | egrep -o '[0-9]+\.[0-9+]\.[0-9]+' | head -n 1)
curl -sSL https://github.com/docker/compose/releases/download/$docker_compose_ver/docker-compose-`uname -s`-`uname -m` \
    -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
