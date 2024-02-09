# first time username=ubuntu, password=ubuntu
# set to lab password.

# make sure to connect to a wifi via netplan first.

# netplan
# sudo sh -c "echo 'network:' > /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '  version: 2' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '  ethernets:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '    eth0:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#  wifis:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#    wlan0:' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#      dhcp4: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#      optional: true' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#      access-points: ' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#        "<WIFI_SSID>": ' >> /etc/netplan/50-cloud-init.yaml"
# sudo sh -c "echo '#          password: <WIFI_PASSWORD>' >> /etc/netplan/50-cloud-init.yaml"
# echo 'Run sudo nano /etc/netplan/50-cloud-init.yaml and change the <WIFI_SSID> and <WIFI_PASSWORD>. If password is 1234, replace <WIFI_PASSWORD> with "1234", including quotes. If SSID is mallab16, replace <WIFI_SSID> with "mallab16", including quotes.'

# auto upgrades
sudo sed -i 's/"1"/"0"/g' /etc/apt/apt.conf.d/20auto-upgrades

# will require authentication
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target


# get next script
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/install_tbot_humble2.sh
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/install_tbot_humble3.sh

chmod +x *.sh

# Create swapfile
sudo swapoff /swapfile
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# sudo nano /etc/fstab
echo 'Append "/swapfile swap swap defaults 0 0" into /etc/fstab using: sudo nano /etc/fstab'
echo 'Then, reboot with "reboot"'

# reboot
