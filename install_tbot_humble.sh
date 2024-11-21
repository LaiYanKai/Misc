# first time login username=ubuntu, password=ubuntu
# set to lab password.
set -euxo pipefail

# netplan
# sudo sh -c "echo 'network:' > /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '  version: 2' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '  ethernets:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '    eth0:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '  wifis:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '    wlan0:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      access-points: ' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '        "$1": ' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '          password: "$2"' >> /etc/netplan/50-cloud-init.yaml"
# echo 'Run sudo nano /etc/netplan/50-cloud-init.yaml and change the <WIFI_SSID> and <WIFI_PASSWORD>. If password is 1234, replace <WIFI_PASSWORD> with "1234", including quotes. If SSID is mallab16, replace <WIFI_SSID> with "mallab16", including quotes.'

# auto upgrades
sudo sed -i 's/"1"/"0"/g' /etc/apt/apt.conf.d/20auto-upgrades

# auto restart services during apt upgrade
echo "\$nrconf{restart} = 'a'" | sudo tee /etc/needrestart/conf.d/autorestart.conf
echo "\$nrconf{kernelhints} = -1" | sudo tee -a /etc/needrestart/conf.d/autorestart.conf

# change ssh permissions in ubuntu 22.04
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config.d/50-cloud-init.conf # can use sudo tee
sudo service sshd restart

# will require authentication
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# get next script
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/install_tbot_humble2.sh

chmod +x *.sh

# Create swapfile
# sudo swapoff /swapfile
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# sudo nano /etc/fstab
sudo sh -c "echo '/swapfile swap swap defaults 0 0' >> /etc/fstab"

reboot
