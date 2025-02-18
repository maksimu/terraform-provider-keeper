#!/bin/bash

#LATEST_TAG=`git describe --tags --abbrev=0`  #v0.1.2
LATEST_TAG=$1
VERSION=${LATEST_TAG#v}
VVERSION=v${VERSION}

echo LATEST_TAG=$LATEST_TAG

export GOOS=darwin;  export GOARCH=amd64 ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=darwin;  export GOARCH=arm64 ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=freebsd; export GOARCH=386   ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=freebsd; export GOARCH=amd64 ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=freebsd; export GOARCH=arm   ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=linux;   export GOARCH=386   ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=linux;   export GOARCH=amd64 ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=linux;   export GOARCH=arm   ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=linux;   export GOARCH=arm64 ;go build -o terraform-provider-keeper_${VVERSION}; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}
export GOOS=windows; export GOARCH=386   ;go build -o terraform-provider-keeper_${VVERSION}.exe; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}.exe
export GOOS=windows; export GOARCH=amd64 ;go build -o terraform-provider-keeper_${VVERSION}.exe; zip -m terraform-provider-keeper_${VERSION}_${GOOS}_${GOARCH}.zip terraform-provider-keeper_${VVERSION}.exe
shasum -a 256 terraform-provider-keeper_${VERSION}_*.zip > terraform-provider-keeper_${VERSION}_SHA256SUMS
