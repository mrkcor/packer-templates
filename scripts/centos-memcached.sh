#!/usr/bin/env bash

# Exit on error
set -e

# Install Memcached server
yum -y install memcached

# Ensure that Memcached starts on boot
chkconfig memcached on

# Start Memcached now
service memcached start
