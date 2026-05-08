#!/bin/bash
# nmap-commands.sh
# Nmap commands used during tool analysis experiment
# All testing conducted in a controlled lab environment against Metasploitable2

# ============================================================
# 1. HOST DISCOVERY
# ============================================================

# Network scope definition
nmap -sn 192.168.64.0/24

# ARP discovery (Layer 2)
nmap -PR 192.168.64.0/24

# TCP SYN discovery
nmap -sn -PS80,443 192.168.64.0/24

# TCP ACK discovery
nmap -sn -PA80,443 192.168.64.0/24

# ============================================================
# 2. PORT SCANNING
# ============================================================

# Basic scan (top 1000 ports)
nmap 192.168.64.6

# SYN stealth scan
sudo nmap -sS 192.168.64.6

# Full TCP connect scan
nmap -sT 192.168.64.6

# Full port scan (all 65535 ports)
nmap -sS -p- 192.168.64.6

# UDP scan
sudo nmap -sU 192.168.64.6

# ============================================================
# 3. SERVICE & OS DETECTION
# ============================================================

# Service version and OS detection
sudo nmap -sV -O 192.168.64.6

# Aggressive scan
sudo nmap -A 192.168.64.6

# ============================================================
# 4. NSE SCRIPTS
# ============================================================

# Vulnerability scripts
sudo nmap --script vuln 192.168.64.6

# HTTP enumeration
nmap --script http-enum -p 80 192.168.64.6

# SSH authentication methods
nmap --script ssh-auth-methods -p 22 192.168.64.6

# MySQL scripts
nmap --script mysql-info,mysql-empty-password,mysql-brute -p 3306 192.168.64.6
