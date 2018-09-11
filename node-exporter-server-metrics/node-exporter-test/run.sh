#!/bin/sh

cd $(dirname "$0")
# Cleanup on exit by ^C
trap 'docker-compose down -v --remove-orphans' INT

# Auto-provisioned dashboards need to use raw datasource name, ref:
# https://github.com/grafana/grafana/issues/10786
sed 's/\${DS_PROMETHEUS}/Prometheus/g' <../node-exporter-server-metrics.json \
    >/tmp/node-exporter-server-metrics-raw.json
docker-compose up
