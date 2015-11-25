#!/bin/sh

mkdir -p /var/monitors/
COUNT=$(wget -q -O -"$@" http://rancher-metadata/2015-07-25/hosts | tail -1 | sed 's/=.*//')
for c in $(seq 0 $COUNT)
do
	APP=$(wget -q -O -"$@" http://rancher-metadata/2015-07-25/hosts/$c/labels/app)
	if [ "$APP" = "emitter" ]
	then
		target=$(wget -q -O -"$@" http://rancher-metadata/2015-07-25/hosts/$c/agent_ip)
		echo "- targets:" > /var/monitors/monitor${c}.yaml
		echo "  - ${target}:4001" >> /var/monitors/monitor${c}.yaml
	fi
done
