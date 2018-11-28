#!/bin/bash

# 
# Usage:
#   create_xr_gopath <absolute_pathname>
#
# <absolute_pathname> is the designed gopath directory.
# The script will create the directory, and the following
# subdir: pkg, bin, src. 
#
# Directory layout:
#  <xr-gopath>/
#             |-src/
#                  |-github.com/
#                  |-...
#             |-bin/
#             |-pkg/
#

export GOROOT=/Users/huanle/opensource/go-1.8.1/go
xr_go=${GOROOT}/bin/go
export GOPATH=${1}

clone_version() {
  echo "Working on: " $1 $2
  ${xr_go} get -d $1
  cd ${GOPATH}/src/$1
  git checkout -b xr_gopath $2
}

mkdir -p ${GOPATH}
mkdir -p ${GOPATH}/src
mkdir -p ${GOPATH}/bin
mkdir -p ${GOPATH}/pkg

# download and install
clone_version google.golang.org/grpc v1.9.1
clone_version google.golang.org/genproto \
	a8101f21cf983e773d0c1133ebc5424792003214
clone_version github.com/golang/protobuf v1.0.0

# make install to install protoc-gen-go and libs
pushd ${GOPATH}/src/github.com/golang/protobuf
PATH=${GOROOT}/bin:${PATH} GOPATH=${GOPATH} make install
popd

clone_version github.com/fsnotify/fsnotify v1.4.7
clone_version github.com/pmylund/go-cache v2.1.0
clone_version golang.org/x/net \
	ab555f366c4508dbe0802550b1b20c46c5c18aa0
clone_version github.com/openconfig/gnoi \
	ef4dc50c3ef7445b16fd6dd1c026d7716252de4d

# 
# Need to download github.com/protocolbuffers/protobuf v3.2.0 release tag
# 
