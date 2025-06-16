# 🛡️ SIEM with Wazuh + ELK Stack

A production-grade Security Information and Event Management (SIEM) system built using **Wazuh** and the **ELK Stack** (Elasticsearch, Logstash, Kibana). Designed for log collection, threat detection, alerting, and forensic analysis in a homelab or small enterprise environment.

---

## 🧠 Purpose

This project simulates real-world defensive monitoring infrastructure. It ingests logs from Windows, Linux, and network devices, runs behavioral analysis, and visualizes security incidents through dashboards and alert rules.

---

## 🧰 Stack Components

| Component     | Purpose                               |
|---------------|----------------------------------------|
| **Wazuh**     | Log analysis, threat detection engine |
| **Filebeat**  | Log shipper for client systems        |
| **Elasticsearch** | Indexing & data storage           |
| **Logstash**  | Pipeline processing                   |
| **Kibana**    | Dashboards & visualizations           |
| **Docker Compose** | Local container orchestration    |

---

## 🔐 Data Sources Ingested

- Windows Security, Sysmon, and PowerShell logs  
- Linux authentication and audit logs  
- pfSense firewall logs via Filebeat  
- Custom PowerShell event log exports  
- IDS/IPS logs (Suricata/Snort optional module)  

---

## 🚨 Sample Use Cases

- Brute force login detection  
- Privilege escalation and lateral movement alerts  
- Malicious script execution or encoded PowerShell  
- Suspicious file creation or permission changes  
- Custom rules for honeypot activity or VPN connections

---

## 📸 Dashboards

![Kibana Overview](docs/kibana-dashboard.png)  
_Screenshot of alerts, login events, and visualizations._

---

## 📁 Folder Structure

```bash
siem-wazuh-elk/
├── docker/
│   ├── docker-compose.yml
│   ├── wazuh/
│   └── elastic/
├── agents/
│   ├── install-guides/
│   └── windows-filebeat.yml
├── rules/
│   ├── custom-wazuh-rules.xml
│   └── decoders/
├── docs/
│   └── kibana-dashboard.png
└── README.md
