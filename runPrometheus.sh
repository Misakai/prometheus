#!/bin/sh

for target in $TARGETS; do 
	echo "    target: \"$target\"" >> /tmp/prometheus.conf.template
done
echo "  }" >> /tmp/prometheus.conf.template
echo "}" >> /tmp/prometheus.conf.template
mv /tmp/prometheus.conf.template /etc/prometheus/prometheus.yml

/bin/prometheus \
  -config.file=/etc/prometheus/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/etc/prometheus/console_libraries \
  -web.console.templates=/etc/prometheus/consoles
