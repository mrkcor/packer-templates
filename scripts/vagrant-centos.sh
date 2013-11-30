#!/usr/bin/env bash

# Exit when any of these commands fail
set -e

# Install wget (this is used in other provision scripts)
yum -y install wget

# Add EPEL repository
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install necessary libraries for guest additions and Vagrant NFS Share
yum -y install gcc make automake autoconf libtool gcc-c++ kernel-headers kernel-devel dkms bzip2

