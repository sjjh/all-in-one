#!/bin/sh

# Only start container if nextcloud is accessible
while ! nc -z "$NEXTCLOUD_HOST" 9000; do
    echo "Waiting for Nextcloud to start..."
    sleep 5
done

set -x
IPv4_ADDRESS_NC="$(dig nextcloud-aio-nextcloud IN A +short | grep '^[0-9.]\+$' | sort | head -n1)"
sed -i "s|NC_IPV4_PLACEHOLDER|$IPv4_ADDRESS_NC|g"
sed -i '/NC_IPV4_PLACEHOLDER/d' /conf/eturnal.yml

IPv6_ADDRESS_NC="$(dig nextcloud-aio-nextcloud AAAA +short | grep '^[0-9a-f:]\+$' | sort | head -n1)"
sed -i "s|NC_IPV6_PLACEHOLDER|$IPv6_ADDRESS_NC|g"
sed -i '/NC_IPV6_PLACEHOLDER/d' /conf/eturnal.yml
set +x

haproxy -f /haproxy.cfg -db
