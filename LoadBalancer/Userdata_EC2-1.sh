#! /bin/bash
sudo -i
yum update -y
yum install nginx -y
systemctl restart nginx  
cd /usr/share/nginx/html
printf "Welcome to WEBSERVER-1" > index.html
