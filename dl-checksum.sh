#!/usr/bin/env sh
VER=${1:-v0.21.0}
DIR=~/Downloads
MIRROR=https://github.com/kubevirt/kubevirt/releases/download/${VER}

dl()
{
    local os=$1
    local arch=$2
    local suffix=${3:-}
    local platform="${os}-${arch}"
    local file="virtctl-${VER}-${platform}${suffix}"
    local lfile=$DIR/$file
    local url=$MIRROR/$file
    if [ ! -e $lfile ];
    then
           wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl darwin amd64
dl linux amd64
dl windows amd64 .exe


