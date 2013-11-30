#!/usr/bin/env bash

# Exit when any of these commands fail
set -e

# Update all packages
yum -y update

# Install necessary libraries for guest additions and Vagrant NFS Share
yum -y install gcc make automake autoconf libtool gcc-c++ kernel-headers-`uname -r` kernel-devel-`uname -r`

# Install wget (this is used in other provision scripts)
yum -y install wget
