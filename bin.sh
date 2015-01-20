#!/bin/bash

if [ "$1" == 'autoconf' ]; then
  echo 'yes'
  exit
fi

if [ "$1" == 'config' ]; then
  cat <<'EOT'
graph_title Tough-Rate
graph_vlabel cps
graph_category voice
incoming.label Calls
incoming.type DERIVE
EOT
  exit 0
fi

curl -s http://127.0.0.1:5704/statistics/incoming-calls | jq -r '"incoming.value \(.count)"'
