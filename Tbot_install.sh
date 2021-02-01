#Configure the Raspberry Pi
# 20auto-upgrades
sudo sh -c "echo 'APT::Periodic::Update-Package-Lists "0";' > /etc/apt/apt.conf.d/20auto-upgrades"
sudo sh -c "echo 'APT::Periodic::Unattended-Upgrade "0";' >> /etc/apt/apt.conf.d/20auto-upgrades"

# netplan
sudo sh -c "echo 'network:' > /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '  version: 2' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '  ethernets:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '    eth0:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#  wifis:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#    wlan0:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#      optional: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#      access-points: ' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#        <WIFI_SSID>: ' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "echo '#          password: <WIFI_PASSWORD>' >> /etc/netplan/50-cloud-init.yaml"
sudo wget -O Tbot_reinstall_wifi.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_reinstall_wifi.sh
sudo wget -O Tbot_install2.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_install2.sh
sudo chmod +x *.sh
sudo reboot