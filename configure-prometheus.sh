#!/bin/sh

MONTORING_HOSTS=$(nslookup $1 | tail -n+5 | grep Address | cut -f 3 -d ' ')

mkdir -p /var/monitors/
COUNTER=0

for target in $MONTORING_HOSTS; do 
	echo "- targets:" > /var/monitors/monitor${COUNTER}.yaml
	echo "  - ${target}:4001" >> /var/monitors/monitor${COUNTER}.yaml
	let COUNTER=COUNTER+1 
done
