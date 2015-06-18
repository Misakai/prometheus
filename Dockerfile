FROM prom/prometheus
MAINTAINER Usman Ismail <usman@techtraits.com>

COPY prometheus.conf /etc/prometheus/prometheus.yml
COPY run-prometheus.sh /bin/run-prometheus.sh
COPY configure-prometheus.sh /bin/configure-prometheus.sh
ENTRYPOINT [ "/bin/run-prometheus.sh" ]
