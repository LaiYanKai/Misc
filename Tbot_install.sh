sudo wget -O /etc/apt/apt.conf.d/20auto-upgrades https://raw.githubusercontent.com/LaiYanKai/EE4308/main/20auto-upgrades
#Configure the Raspberry Pi
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo reboot
