🛡️ SIEM with Wazuh + ELK Stack

A production‑grade Security Information and Event Management (SIEM) system built using Wazuh + Elastic (Elasticsearch, Logstash, Kibana). Designed for log collection, threat detection, alerting, and forensic analysis in a homelab or small enterprise environment.

🧠 Purpose

This project simulates real‑world defensive monitoring infrastructure. It ingests logs from Windows, Linux, and network devices, runs behavioral analysis with Wazuh rules, and visualizes incidents through Kibana dashboards and alerting rules. It bridges the modern Wazuh Indexer (OpenSearch) into Elasticsearch/Kibana using a Logstash pipeline, giving you full visibility and flexibility.

🧰 Stack Components
Component	Purpose
Wazuh	Log analysis, correlation, and threat detection engine
Wazuh Indexer	Primary data store for Wazuh alerts (OpenSearch backend)
Logstash Bridge	Transfers alerts from Wazuh Indexer → Elasticsearch
Elasticsearch	Secondary indexing + search for Kibana visualizations
Kibana	Dashboards & visualizations
Filebeat	Log shipper for endpoints (Windows/Linux/pfSense)
Docker Compose	Local container orchestration
Ansible	Automated provisioning & configuration
🔐 Data Sources Ingested

Windows Security, Sysmon, and PowerShell logs

Linux authentication and audit logs

pfSense firewall logs via Filebeat

Custom PowerShell event log exports

IDS/IPS logs (Suricata/Snort optional)

Honeypot or VPN connection logs (customizable)

🚨 Sample Use Cases

Brute force login detection (Windows/Linux)

Privilege escalation and lateral movement alerts

Malicious script execution (encoded PowerShell, suspicious binaries)

Suspicious file creation, deletion, or permission changes

Honeypot interaction alerts and VPN log monitoring

Forensic timeline analysis of compromised hosts

📸 Dashboards

Kibana Overview: Visualizations for alerts, login events, authentication failures, and attack patterns.

(Add your screenshots in docs/ and update this section with examples)

📁 Folder Structure
siem-wazuh-elk/
├── README.md               # Documentation
├── .env.example            # Environment variables
├── docker/
│   ├── compose.wazuh.yml   # Wazuh (manager, indexer, dashboard)
│   ├── compose.elastic.yml # Elasticsearch + Kibana
│   ├── compose.logstash.yml# Logstash bridge
│   └── snippets/           # Shared config snippets (ulimits, labels, etc.)
├── agents/
│   ├── install-guides/     # Endpoint setup (Windows/Linux/pfSense)
│   └── windows-filebeat.yml# Filebeat config example
├── logstash/
│   ├── pipelines.d/        # Wazuh → Elasticsearch pipeline
│   └── templates/          # Index templates & CA certs
├── rules/
│   ├── custom-wazuh-rules.xml # Extend Wazuh detection
│   └── decoders/              # Custom decoders
├── ansible/
│   └── site.yml            # IaC automation playbook
├── scripts/
│   ├── bootstrap.sh        # Install Docker + setup network
│   ├── backup-wazuh-indexer.sh
│   ├── backup-elasticsearch.sh
│   └── healthcheck.sh
└── docs/
    └── kibana-dashboard.png   # Sample screenshot
✅ Features

End‑to‑end containerized setup with Docker Compose

Ansible automation for fast provisioning

Custom Wazuh rules/decoders for advanced detection

TLS support for secure communications

Logstash keystore integration for credential management

Backup scripts for both Wazuh Indexer and Elasticsearch

CI linting & checks for repo quality

🚀 Quick Start

Clone repo and configure .env variables.

Run sudo bash scripts/bootstrap.sh to install prerequisites.

Start services with docker compose -f docker/compose.wazuh.yml up -d, then Elastic and Logstash.

Access Wazuh Dashboard (default 5601) and Kibana (default 5602).

🔒 Hardening

Mount certs read‑only.

Use separate TLS for Wazuh Indexer and Elasticsearch.

Store secrets in Logstash keystore.

Restrict port exposure in Compose files.

Pin image versions or digests for stability.

📌 Roadmap

Add Terraform modules for cloud/on‑prem provisioning.

Add Filebeat enrollment automation (Windows/Linux agents).

Publish pre‑built Kibana dashboards & index patterns.

Add Grafana as alternative visualization option.

📜 License

MIT
