#!/bin/bash
# assume Rpi 5, 4GB/8GB/16GB
set -exo pipefail

# ==========================
# # netplan
# # sudo sh -c "echo 'network:' > /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '  version: 2' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '  ethernets:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '    eth0:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '  wifis:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '    wlan0:' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '      access-points: ' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '        "$1": ' >> /etc/netplan/50-cloud-init.yaml"
# # sudo sh -c "echo '          password: "$2"' >> /etc/netplan/50-cloud-init.yaml"
# # echo 'Run sudo nano /etc/netplan/50-cloud-init.yaml and change the <WIFI_SSID> and <WIFI_PASSWORD>. If password is 1234, replace <WIFI_PASSWORD> with "1234", including quotes. If SSID is mallab16, replace <WIFI_SSID> with "mallab16", including quotes.'

# auto upgrades
sudo sed -i 's/"1"/"0"/g' /etc/apt/apt.conf.d/20auto-upgrades

# will require authentication
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# for Desktop versions only
# gsettings set org.gnome.desktop.screensaver lock-enabled false

# get next script
cd $HOME
wget -O install_tbot2.sh https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1/install_tbot2.sh
wget -O install_tbot3.sh https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1/install_tbot3.sh
wget -O flash.sh https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1/flash.sh
wget -O robot.sh https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1/robot.sh
# wget -O camera.sh https://raw.githubusercontent.com/LaiYanKai/Misc/main/tb3_jazzy_c1_cam3/camera.sh

chmod +x *.sh

# # create swap memory if using 2GB rpi
# # sudo swapoff /swapfile
# sudo fallocate -l 4G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
# # sudo nano /etc/fstab
# sudo sh -c "echo '/swapfile swap swap defaults 0 0' >> /etc/fstab"

sudo reboot
