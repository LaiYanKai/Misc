# Time Synchronization with Chrony

This guide shows how to set up time synchronization between a PC (time server) and Raspberry Pi (client) using Chrony.

## On the PC (Time Server)

### 1. Check Network Configuration

```bash
hostname -I
```

Check the IP (e.g., 192.168.1.3) and subnet (192.168.1.0/24)

### 2. Install Chrony

```bash
sudo apt update && sudo apt install chrony -y
```

### 3. Configure Chrony

Edit the configuration file:

```bash
sudo nano /etc/chrony/chrony.conf
```

Add these 2 lines at the end of the file:

```conf
allow 192.168.1.0/24
local stratum 10
```

- `allow 192.168.1.0/24`: Allows clients from this subnet to sync time
- `local stratum 10`: Makes this PC act as a local time source

### 4. Restart Chrony Service

```bash
sudo systemctl restart chrony
```

### 5. Verify Server Status

```bash
sudo systemctl status chrony
chronyc tracking
```

## On the Raspberry Pi (Client)

### 1. Install Chrony

```bash
sudo apt update && sudo apt install chrony -y
```

### 2. Configure Chrony

Edit the configuration file:

```bash
sudo nano /etc/chrony/chrony.conf
```

Add this line at the end of the file:

```conf
server 192.168.1.3 iburst
```

- `server 192.168.1.3`: IP address of your PC time server
- `iburst`: Speeds up initial synchronization

### 3. Restart Chrony Service

```bash
sudo systemctl restart chrony
```

### 4. Verify Synchronization

Check if the Raspberry Pi is syncing with the PC:

```bash
chronyc sources
chronyc tracking
```

You should see your PC (192.168.1.3) listed as a time source.

## Troubleshooting

### Check if the server is reachable

```bash
ping 192.168.1.3
```

### Check firewall settings

If synchronization fails, ensure NTP port (123/UDP) is open:

```bash
# On the PC
sudo ufw allow 123/udp
```

### View detailed synchronization status

```bash
chronyc sourcestats
```