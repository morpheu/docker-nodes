#!/bin/bash -e
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo "deb https://get.docker.io/ubuntu docker main" | tee /etc/apt/sources.list.d/docker.list
apt-get update && apt-get install linux-image-extra-$(uname -r) -y && apt-get install lxc-docker -y
sed -i -e '/^DOCKER_OPTS/d' /etc/default/docker && echo "DOCKER_OPTS=' -e native -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock'" | tee -a /etc/default/docker
( stop docker && start docker ) || start docker
