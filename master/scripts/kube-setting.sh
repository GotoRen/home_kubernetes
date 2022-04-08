#!/bin/sh

### docker
curl -sSL https://get.docker.com | sh
usermod -aG docker $(whoami)
systemctl enable docker

which docker
docker --version


### docker-compose
apt install -y libffi-dev libssl-dev

anyenv install pyenv
exec $SHELL -l
which pyenv

pyenv install 3.8.1
exec $SHELL -l
pyenv global 3.8.1
pyenv versions
pyenv rehash

which python3
python3 --version

pip3 install --upgrade pip
pip3 list --outdated | awk 'NR>2 {print $1}' | xargs pip install -U
pip3 install docker-compose
pip3 list

which docker-compose
docker-compose --version


### kubernetes
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt update && apt upgrade -y

apt install -y kubelet
which kubelet
kubelet --version

apt install -y kubeadm
which kubeadm
kubeadm version

apt install -y kubectl
which kubectl
kubectl version
