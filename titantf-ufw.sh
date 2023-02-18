#!/bin/sh

curl -s https://www.cloudflare.com/ips-v4 -o /tmp/titantf_ips
echo "" >> /tmp/titantf_ips

# Allow all traffic from Cloudflare IPs (no ports restriction)
for cfip in `cat /tmp/titantf_ips`; do ufw allow proto tcp from $cfip comment 'titan.tf IP'; done

ufw reload > /dev/null
