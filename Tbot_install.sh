#Configure the Raspberry Pi
# 20auto-upgrades
sudo sh -c "echo 'APT::Periodic::Update-Package-Lists "0";' > /etc/apt/apt.conf.d/20auto-upgrades"
sudo sh -c "echo 'APT::Periodic::Unattended-Upgrade "0";' >> /etc/apt/apt.conf.d/20auto-upgrades"

# netplan
sudo sh -c "'network:' > /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'  version: 2' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'  ethernets:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'    eth0:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'      optional: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'  wifis:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'    wlan0:' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'      optional: true' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'#      access-points: ' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'#        <WIFI_SSID>: ' >> /etc/netplan/50-cloud-init.yaml"
sudo sh -c "'#          password: <WIFI_PASSWORD>' >> /etc/netplan/50-cloud-init.yaml"
sudo wget -O Tbot_reinstall_wifi.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_reinstall_wifi.sh
sudo wget -O Tbot_install2.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_install2.sh
sudo chmod +x *.sh
sudo reboot