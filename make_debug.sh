#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.
# authors: adiyoss and adefossez

DSET=debug
SUBFOLDER=tr
NOISY_DIR=dataset/debug/noisy
CLEAN_DIR=dataset/debug/clean

if [ ! -z "$1" ]; then
    DSET=$1
fi

if [ ! -z "$2" ]; then
    SUBFOLDER=$2
fi

if [ ! -z "$3" ]; then
    NOISY_DIR=$3
fi

if [ ! -z "$4" ]; then
    CLEAN_DIR=$4
fi

path=egs/$DSET/$SUBFOLDER
if [[ ! -e $path ]]; then
    mkdir -p $path
fi
python3 -m denoiser.audio $NOISY_DIR > $path/noisy.json
python3 -m denoiser.audio $CLEAN_DIR > $path/clean.json
