#!/bin/sh

# Regenerate configuration every 30s from DNS
watch -n 30 /bin/configure-prometheus.sh monitoring &> /dev/null &

/bin/prometheus \
	-config.file=/etc/prometheus/prometheus.yml \
	-storage.local.path=/prometheus \
	-web.console.libraries=/etc/prometheus/console_libraries \
	-web.console.templates=/etc/prometheus/consoles
