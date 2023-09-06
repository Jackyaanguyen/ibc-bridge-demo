#!/bin/bash

FIRST_NETWORK=$1
SECOND_NETWORK=$2

# check that FIRST_NETWORK and SECOND_NETWORK are set
if [ -z "$FIRST_NETWORK" ] || [ -z "$SECOND_NETWORK" ]; then
    echo "Please specify the first and second networks to run the test"
    exit 1
fi

export ROOT=$(pwd)

export FIRST_NETWORK
export SECOND_NETWORK

export MNEMONIC_1="health trigger enlist unusual boost apart chalk pulp universe bread betray mesh naive potato dose grain what liar merry render guide cancel suspect tide"
export MNEMONIC_2="course example name lab lab glass alarm bunker spend midnight saddle picnic snow unknown jungle begin session among panda raven calm talent acquire chalk"
export MNEMONIC_3="example cotton rail lawsuit tourist forward pitch box duck pelican diamond guess crawl desert scare equip omit spy exit cable zoo aerobic corn concert"

export NETWORK_1_ADDRESSES=($(jq -r '.addresses | @sh' "$ROOT/template/$FIRST_NETWORK/config.json" | tr -d \'))
export NETWORK_2_ADDRESSES=($(jq -r '.addresses | @sh' "$ROOT/template/$SECOND_NETWORK/config.json" | tr -d \'))

NETWORK_1_BINARY=$(jq -r '."chain-binary"' "$ROOT/template/$FIRST_NETWORK/config.json")
NETWORK_1_DENOM=$(jq -r '.denom' "$ROOT/template/$FIRST_NETWORK/config.json")
NETWORK_1_ID=$(jq -r '."chain-id"' "$ROOT/template/$FIRST_NETWORK/config.json")
NETWORK_1_NODE=$(jq -r '.node' "$ROOT/template/$FIRST_NETWORK/config.json")

NETWORK_2_BINARY=$(jq -r '."chain-binary"' "$ROOT/template/$SECOND_NETWORK/config.json")
NETWORK_2_DENOM=$(jq -r '.denom' "$ROOT/template/$SECOND_NETWORK/config.json")
NETWORK_2_ID=$(jq -r '."chain-id"' "$ROOT/template/$SECOND_NETWORK/config.json")
NETWORK_2_NODE=$(jq -r '.node' "$ROOT/template/$SECOND_NETWORK/config.json")

export BINARY=( "$ROOT/build/binary/$NETWORK_1_BINARY" "$ROOT/build/binary/$NETWORK_2_BINARY" )
export CONFIG_DIR=( "$ROOT/network/config/$FIRST_NETWORK" "$ROOT/network/config/$SECOND_NETWORK" )
export DENOMS=( "$NETWORK_1_DENOM" "$NETWORK_2_DENOM" )
export NODE=( "$NETWORK_1_NODE" "$NETWORK_2_NODE" )
export CHAINID=( "$NETWORK_1_ID" "$NETWORK_2_ID" )