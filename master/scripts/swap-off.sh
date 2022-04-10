#!/bin/sh

OS_NAME="$(uname | awk '{print tolower($0)}')"
OS_FULL="$(uname -a)"
OS_TYPE=
ARCH_TYPE=""

case $(uname -m) in
    i386)   ARCH_TYPE="386" ;;
    i686)   ARCH_TYPE="386" ;;
    x86_64) ARCH_TYPE="amd64" ;;
    aarch64) ARCH_TYPE="arm64" ;;
    armv7l)  ARCH_TYPE="arm" ;;
    arm)    dpkg --print-architecture | grep -q "arm64" && ARCH_TYPE="arm64" || ARCH_TYPE="arm" ;;
esac

### checking package type.
if [ "${OS_NAME}" == "linux" ]; then
    if [ $(echo "${OS_FULL}" | grep -c "amzn1") -gt 0 ]; then
        OS_TYPE="yum"
    elif [ $(echo "${OS_FULL}" | grep -c "amzn2") -gt 0 ]; then
        OS_TYPE="yum"
    elif [ $(echo "${OS_FULL}" | grep -c "el6") -gt 0 ]; then
        OS_TYPE="yum"
    elif [ $(echo "${OS_FULL}" | grep -c "el7") -gt 0 ]; then
        OS_TYPE="yum"
    elif [ $(echo "${OS_FULL}" | grep -c "Ubuntu") -gt 0 ]; then
        OS_TYPE="apt"
    elif [ $(echo "${OS_FULL}" | grep -c "coreos") -gt 0 ]; then
        OS_TYPE="apt"
    fi
elif [ "${OS_NAME}" == "darwin" ]; then
    OS_TYPE="brew"
fi

### processing by architecture-type and os-type
if [ "${OS_NAME}" == "darwin" ]; then
  echo "Your platform ($(uname -a)) is not supported."
  OS='Mac'
elif [ "${OS_NAME}" == "linux" ]; then
  if [ "${ARCH_TYPE}" == "amd64" ]; then
    #Ubuntu(Intel chip).
    echo "Your system is amd64."
    swapoff -a
    vim /etc/fstab

  elif [ "${ARCH_TYPE}" == "arm64" ]; then
    echo "Your system is arm64."
    #RaspberryPi 4 over.
    swapoff -a
    dphys-swapfile swapoff
    dphys-swapfile uninstall
    update-rc.d dphys-swapfile remove

    systemctl daemon-reload
    systemctl restart kubelet
    systemctl status kubelet
  elif [ "${ARCH_TYPE}" == "arm" ]; then
    echo "Your system is arm."
    #RaspberryPi 4 less.
    swapoff -a
    dphys-swapfile swapoff
    dphys-swapfile uninstall
    update-rc.d dphys-swapfile remove
    
    systemctl daemon-reload
    systemctl restart kubelet
    systemctl status kubelet
  fi
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
fi
