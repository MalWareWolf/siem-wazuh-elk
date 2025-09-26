#!/usr/bin/env bash
set -euo pipefail
SNAPSHOT_DIR=${1:-/srv/elastic/snapshots}
mkdir -p "$SNAPSHOT_DIR"
DATESTAMP=$(date +%Y%m%d-%H%M%S)

echo "Creating Elasticsearch snapshot $DATESTAMP into $SNAPSHOT_DIR"
curl -k -u "$ELASTIC_USERNAME:$ELASTIC_PASSWORD"   -XPUT "https://localhost:${ELASTIC_HTTP}/_snapshot/es_repo/snap-${DATESTAMP}?wait_for_completion=true"
