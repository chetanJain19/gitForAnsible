#!/bin/bash

sudo apt update -y
sudo apt install default-jdk -y
sudo apt-cache search tomcat
sudo apt install tomcat9 tomcat9-admin -y
sudo ufw allow from any to any port 9090 proto tcp

#change the port number from 8080 to 9090

sudo sed -i 's/Connector port="8080"/Connector port="9090"/Ig' /etc/tomcat9/server.xml

#inside tomcat-users.xml paste below commands and allign properly

sudo sed -i '56 i <role rolename="admin-gui"/>' /etc/tomcat9/tomcat-users.xml
sudo sed -i '57 i <role rolename="manager-gui"/>' /etc/tomcat9/tomcat-users.xml
sudo sed -i '58 i <user username="tomcat" password="pass" roles="admin-gui,manager-gui"/>' /etc/tomcat9/tomcat-users.xml
