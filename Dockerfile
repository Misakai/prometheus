FROM prom/prometheus
MAINTAINER Roman Atachiants <roman@emitter.io>

COPY prometheus.conf /etc/prometheus/prometheus.yml
COPY run-prometheus.sh /bin/run-prometheus.sh
COPY configure-prometheus.sh /bin/configure-prometheus.sh
ENTRYPOINT [ "/bin/run-prometheus.sh" ]
