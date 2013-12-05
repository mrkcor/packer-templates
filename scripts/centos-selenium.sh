#!/usr/bin/env bash

# Crash on error
set -e

# Install Java, Xvfb and Firefox
yum -y install java-1.7.0-openjdk xorg-x11-server-Xvfb firefox

if [ -a "/usr/local/bin/selenium-server-standalone-2.37.0.jar" ]; then
   echo "Selenium server already present"
else
   cd /usr/local/bin
   curl -sO http://selenium.googlecode.com/files/selenium-server-standalone-2.37.0.jar
fi

# Ensure that we have a machine ID for dbus (otherwise Xvfb won't work properly)
if [ ! -f /var/lib/dbus/machine-id ]; then
   dbus-uuidgen > /var/lib/dbus/machine-id
fi

# Setup Xvfb to start on boot
cat >/etc/init/xvfb.conf <<EOL
description "Xvfb"

start on runlevel [2345]
stop on runlevel [^2345]

respawn

script
  su vagrant -c "Xvfb :99"
end script
EOL

initctl start xvfb

# Setup Selneium to start on boot
cat >/etc/init/selenium.conf <<EOL
description "Selenium"
env DISPLAY=:99

start on started xvfb
stop on runlevel [^2345] or stopping xvfb

respawn

script
  su vagrant -c "cd /usr/local/bin && java -jar selenium-server-standalone-2.37.0.jar"
end script
EOL

initctl start selenium
