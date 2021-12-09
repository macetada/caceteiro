#!/bin/bash

set -eu

HOST=${1}
SERVERS=${2}
CLIENTS=${3}
REQUESTS=${4}
SLEEP=${5}

IFS=';' read -ra ports <<<"$SERVERS"
for port in "${ports[@]}"; do
  host="http://${HOST}:${port}"

  ab -k -c "${CLIENTS}" -n "${REQUESTS}" "${host}/"
  echo ""
  sleep "${SLEEP}"

  wrk -t "${CLIENTS}" -c "${REQUESTS}" -d "${SLEEP}" --latency "${host}/"
  echo "============================================================"
  sleep "${SLEEP}"
done
