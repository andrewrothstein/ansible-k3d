#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/k3d-io/k3d/releases/download
APP=k3d


dl()
{
    local lchecksums=$1
    local ver=$2
    local os=$3
    local arch=$4
    local dotexe=${5:-}
    local platform="${os}-${arch}"
    local url="${MIRROR}/${ver}/${APP}-${platform}${dotexe}"
    local file="${APP}-${platform}${dotexe}"
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep -e "$file\$" $lchecksums| awk '{print $1}')
}

dlver () {
    local ver=$1
    local lchecksums="${DIR}/${APP}-${ver}-checksums.txt"

    # https://github.com/k3d-io/k3d/releases/download/v5.8.1/checksums.txt
    local rchecksums="${MIRROR}/${ver}/checksums.txt"
    if [ ! -e "${lchecksums}" ];
    then
        curl -sSLf -o "${lchecksums}" "${rchecksums}"
    fi

    printf "  # %s\n" $rchecksums
    printf "  %s:\n" $ver
    dl $lchecksums $ver darwin amd64
    dl $lchecksums $ver darwin arm64
    dl $lchecksums $ver linux amd64
    dl $lchecksums $ver linux 386
    dl $lchecksums $ver linux arm
    dl $lchecksums $ver linux arm64
    dl $lchecksums $ver windows amd64 .exe
}

dlver ${1:-v5.8.3}
