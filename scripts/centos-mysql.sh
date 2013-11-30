#!/usr/bin/env bash

# Exit on error
set -e

# Install MySQL server and client programs
yum -y install mysql-server

# Ensure that MySQL starts on boot
chkconfig mysqld on

# Start MySQL now
service mysqld start
