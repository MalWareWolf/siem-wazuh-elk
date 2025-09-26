#!/usr/bin/env bash
set -euo pipefail
echo "[*] Checking containers..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "[*] Checking Wazuh Indexer health..."
curl -k "https://localhost:${WAZUH_INDEXER_HTTP}" || true

echo "[*] Checking Elasticsearch health..."
curl -k -u "$ELASTIC_USERNAME:$ELASTIC_PASSWORD" "https://localhost:${ELASTIC_HTTP}/_cluster/health?pretty" || true
