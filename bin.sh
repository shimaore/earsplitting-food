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
incoming.min 0
attempts.label Attempts
attempts.type DERIVE
attempts.min 0
success.label Success
success.type DERIVE
success.min 0
EOT
  exit 0
fi

curl -s 'http://127.0.0.1:5704/statistics/incoming-calls' \
  | jq -r '"incoming.value \(.count)"'
curl -s 'http://127.0.0.1:5704/statistics/call-attempts' \
  | jq -r '"attempts.value \(.count)"'
curl -s 'http://127.0.0.1:5704/statistics/%5B"cause","SUCCESS"%5D' \
  | jq -r '"success.value \(.count)"'
