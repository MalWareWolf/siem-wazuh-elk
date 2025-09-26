#!/usr/bin/env bash
set -euo pipefail
SNAPSHOT_DIR=${1:-/srv/wazuh/snapshots}
mkdir -p "$SNAPSHOT_DIR"
DATESTAMP=$(date +%Y%m%d-%H%M%S)

echo "Creating Wazuh Indexer snapshot $DATESTAMP into $SNAPSHOT_DIR"
curl -k -u "$WAZUH_INDEXER_USERNAME:$WAZUH_INDEXER_PASSWORD"   -XPUT "https://localhost:${WAZUH_INDEXER_HTTP}/_snapshot/wazuh_repo/snap-${DATESTAMP}?wait_for_completion=true"
