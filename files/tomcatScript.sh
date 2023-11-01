#!/bin/bash

sudo apt update -y
sudo apt install default-jdk -y
sudo apt-cache search tomcat
sudo apt install tomcat9 tomcat9-admin -y
sudo ufw allow from any to any port 9090 proto tcp
sudo cp /etc/tomcat9/server.xml /etc/tomcat9/server.xml.bak  # Create a backup of the original file
sudo cp /tmp/tomcat-install/templates/serverxml.j2 /etc/tomcat9/server.xml

if [ -f /etc/tomcat9/tomcat-users.xml ]; then
    sudo sed -i 'some_edit_command' /etc/tomcat9/tomcat-users.xml
else
    echo "tomcat-users.xml does not exist. Skipping the edit."
fi
