#!/bin/bash
sudo su
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<h1>Current ec2 is "$(sudo hostname -f)" </h1>" > /var/www/html/index.html
