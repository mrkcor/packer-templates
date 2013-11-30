#!/usr/bin/env bash

# Exit when any of these commands fail
set -e

# Update all packages
yum -y update

# Reboot
reboot

# Sleep a while...
sleep 60
