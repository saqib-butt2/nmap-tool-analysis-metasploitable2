# Nmap Network Scanning — Tool Analysis Report

---

## Overview

Detailed analysis and practical evaluation of Nmap as a network reconnaissance
and vulnerability assessment tool. Conducted within a controlled virtual lab
environment using Kali Linux as the scanning machine and Metasploitable2 as
the deliberately vulnerable target.

---

## Lab Environment

| Machine        | Role           | IP              |
|----------------|----------------|-----------------|
| Kali Linux     | Authorized scanner | 192.168.64.5 |
| Metasploitable2 | Target        | 192.168.64.6    |

- **Network:** UTM shared network — `192.168.64.0/24`
- **Platform:** UTM (Type II Hypervisor) on Apple Silicon macOS

---

## Objectives

1. Perform network host discovery across the subnet
2. Enumerate open ports and running services on the target
3. Detect service versions and operating system fingerprint
4. Run NSE vulnerability scripts and validate findings
5. Evaluate Nmap usability, effectiveness, strengths and limitations

---

## Scanning Techniques Applied

| Technique | Command | Purpose |
|-----------|---------|---------|
| Host discovery | `nmap -sn 192.168.64.0/24` | Identify active hosts |
| ARP discovery | `nmap -PR 192.168.64.0/24` | Layer 2 discovery |
| TCP SYN discovery | `nmap -sn -PS80,443` | Bypass ICMP filtering |
| TCP ACK discovery | `nmap -sn -PA80,443` | Firewall analysis |
| SYN stealth scan | `nmap -sS 192.168.64.6` | Half-open port scan |
| Full TCP scan | `nmap -sT 192.168.64.6` | Full handshake scan |
| Full port scan | `nmap -sS -p- 192.168.64.6` | All 65535 ports |
| UDP scan | `nmap -sU 192.168.64.6` | UDP services |
| Version + OS | `nmap -sV -O 192.168.64.6` | Fingerprinting |
| Aggressive scan | `nmap -A 192.168.64.6` | Deep enumeration |
| NSE vuln scripts | `nmap --script vuln` | Vulnerability detection |

---

## Key Vulnerabilities Identified

| Service | Version | Vulnerability | CVE |
|---------|---------|---------------|-----|
| vsftpd | 2.3.4 | Backdoor RCE | CVE-2011-2523 |
| UnrealIRCd | — | Trojaned backdoor | CVE-2010-2075 |
| OpenSSL | — | POODLE attack | CVE-2014-3566 |
| OpenSSL | — | Logjam attack | CVE-2015-4000 |
| OpenSSL | — | CCS injection | CVE-2014-0224 |
| Apache HTTP | 2.2.8 | Slowloris DoS | CVE-2007-6750 |
| MySQL | 5.0.51a | Empty/weak credentials | — |
| Java RMI | — | Remote code execution | — |

---

## Exploitation Validated

### vsftpd 2.3.4 Backdoor (CVE-2011-2523)
- Used Metasploit module `exploit/unix/ftp/vsftpd_234_backdoor`
- Triggered backdoor via username containing `:)`
- Bind shell opened on port 6200 — root access confirmed

### MySQL Weak Authentication
- NSE scripts `mysql-empty-password` and `mysql-brute` identified credentials
- `guest` account with empty password and `root` with password `password`
- Validated via phpMyAdmin and remote MySQL connection from Kali

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Nmap | Network scanning and enumeration |
| Metasploit | Exploit validation |
| Netcat | Service interaction |
| Python | Banner grabbing and scan automation |
| Firefox | Web service validation |

---

## Repository Files

| File | Description |
|------|-------------|
| `README.md` | This file |
| `nmap-commands.sh` | All Nmap commands used in the experiment |
| `banner-grab.py` | Python banner grabbing script |
| `auto-nmap.py` | Python automated Nmap scanning script |

---

## Video Presentation

[Watch on Google Drive](https://drive.google.com/file/d/1M6IlPZMfkJFu7peWdJsYch0VxZJWp/view?usp=sharing)

---

## References

- Lyon, G. (2009) *Nmap Network Scanning*. Insecure.Com LLC.
- Nmap Project — https://nmap.org
- Exploit-DB CVE-2011-2523 — https://www.exploit-db.com
- Metasploitable2 — https://github.com/rapid7/metasploitable3

---

> **Disclaimer:** All scanning and exploitation activities were conducted
> against a deliberately vulnerable machine (Metasploitable2) within a
> controlled virtual lab environment as part of module CSI_7_PTE at London
> South Bank University. Authorised for educational purposes only.
