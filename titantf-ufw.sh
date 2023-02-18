#!/bin/sh

curl -s https://raw.githubusercontent.com/TitanTF/titantf-ufw/master/ipv4.txt -o /tmp/titantf_ips
echo "" >> /tmp/titantf_ips

# Allow all traffic from Titan.TF IPs (no ports restriction)
for cfip in `cat /tmp/titantf_ips`; do ufw allow proto tcp from $cfip comment 'titan.tf IP'; done

ufw reload > /dev/null
