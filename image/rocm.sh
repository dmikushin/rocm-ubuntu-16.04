#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

# Add ROCm repository.
$minimal_apt_get_install wget
wget -qO - http://repo.radeon.com/rocm/apt/debian/rocm.gpg.key | apt-key add -
echo 'deb [arch=amd64] http://repo.radeon.com/rocm/apt/debian/ xenial main' | tee /etc/apt/sources.list.d/rocm.list
apt-get update

## Install ROCm components. 
$minimal_apt_get_install git rocm-dev rocfft rocblas miopen-hip opencl-headers rocrand rccl hipsparse hipcub

## Install Python components.
$minimal_apt_get_install python3-numpy python3-dev python3-wheel python3-mock python3-future python3-pip python3-yaml python3-setuptools

