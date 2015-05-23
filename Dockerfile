FROM prom/prometheus
MAINTAINER Usman Ismail <usman@techtraits.com>
COPY prometheus.conf.template /tmp/prometheus.conf.template
COPY runPrometheus.sh /bin/runPrometheus.sh
ENTRYPOINT [ "/bin/runPrometheus.sh" ]
