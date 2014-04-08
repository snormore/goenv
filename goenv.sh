#!/bin/bash
REPO=$1
DEFAULT_GOPATH=".go"
GOPATH_ARG=$2
CWD=$(pwd)
GOPATH_REL=${GOPATH_ARG:-$DEFAULT_GOPATH}
GOPATH=$CWD/$GOPATH_REL
GOBIN=$GOPATH/bin
set -e
mkdir -p $GOBIN
mkdir -p $GOPATH/src/`dirname $REPO`
[ -d $GOPATH/src/$REPO ] || ln -sfv $CWD $GOPATH/src/$REPO
echo "goenv created at $GOPATH"
cat > $GOBIN/activate << EOF
export GOPATH=$GOPATH
export GOBIN=$GOBIN
export PS1="(\$(basename $GOPATH)) \$PS1"
EOF
chmod +x $GOBIN/activate
echo "enter the environment with 'source $GOPATH_REL/bin/activate'"

