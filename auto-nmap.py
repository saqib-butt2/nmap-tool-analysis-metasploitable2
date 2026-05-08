# auto-nmap.py
# Python script to automate Nmap scanning and save results to file
# All testing conducted in a controlled lab environment against Metasploitable2

import subprocess

TARGET = "192.168.64.6"
OUTPUT_FILE = "output_file.txt"

print(f"[*] Starting automated Nmap scan against {TARGET}")

command = ["nmap", "-sV", "-O", "-p-", TARGET]

result = subprocess.run(command, capture_output=True, text=True)

with open(OUTPUT_FILE, "w") as f:
    f.write(result.stdout)

print(f"[+] Scan complete. Results saved to {OUTPUT_FILE}")
print(result.stdout)
