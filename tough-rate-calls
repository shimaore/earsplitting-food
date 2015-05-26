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
incoming.colour ffcc00
attempts.label Attempts
attempts.type DERIVE
attempts.min 0
attemps.colour 008f00
success.label Success
success.type DERIVE
success.min 0
success.colour 00cc00
EOT
  exit 0
fi

curl -s 'http://127.0.0.1:5704/statistics' \
  | jq -r '
"incoming.value \(.["incoming-calls"].count)
attempts.value \(.["call-attempts"].count)
success.value \(.["connected-calls"].count)"'
