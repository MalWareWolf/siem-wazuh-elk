#!/usr/bin/env bash
set -euo pipefail

# Basic deps
if ! command -v docker >/dev/null 2>&1; then
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker "$USER" || true
fi

# Compose v2 sanity
if ! docker compose version >/dev/null 2>&1; then
  echo "Docker Compose v2 is required."
  exit 1
fi

# Create shared network if missing
source ./.env
if ! docker network inspect "$SIEM_NET" >/dev/null 2>&1; then
  docker network create "$SIEM_NET" --subnet "$SIEM_SUBNET"
fi

# Create data dirs
mkdir -p "$WAZUH_DATA" "$WAZUH_CERTS" "$ELASTIC_DATA" "$ELASTIC_CERTS"

echo "Bootstrap complete. Log out/in to refresh docker group if newly added."
