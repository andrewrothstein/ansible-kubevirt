#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/kubevirt/kubevirt/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local platform="${os}-${arch}"
    local file="virtctl-${ver}-${platform}${suffix}"
    local lfile=$DIR/$file
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin arm64
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver windows amd64 .exe
}

dl_ver ${1:-v1.2.0}
