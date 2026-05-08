# banner-grab.py
# Python banner grabbing script to retrieve service banners from target
# All testing conducted in a controlled lab environment against Metasploitable2

import socket

TARGET = "192.168.64.6"

PORTS = {
    21:  "FTP",
    22:  "SSH",
    25:  "SMTP",
    80:  "HTTP",
    3306: "MySQL"
}

for port, service in PORTS.items():
    try:
        s = socket.socket()
        s.settimeout(3)
        s.connect((TARGET, port))
        banner = s.recv(1024).decode(errors="ignore").strip()
        print(f"[+] Port {port} ({service}): {banner}")
        s.close()
    except Exception as e:
        print(f"[-] Port {port} ({service}): Could not retrieve banner — {e}")
