#!/usr/bin/env bash

# Exit when any of these commands fail
set -e

# Update all existing packages
apt-get -y update
apt-get -y upgrade

# Install necessary libraries for guest additions and Vagrant NFS Share
apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Install wget (this is used in other provision scripts)
apt-get -y -q install wget
