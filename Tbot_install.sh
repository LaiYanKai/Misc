#Configure the Raspberry Pi
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo wget -O /etc/apt/apt.conf.d/20auto-upgrades https://raw.githubusercontent.com/LaiYanKai/EE4308/main/20auto-upgrades
sudo wget -O Tbot_reinstall_wifi.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_reinstall_wifi.sh
sudo wget -O Tbot_install3.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_install3.sh
sudo wget -O Tbot_install2.sh https://raw.githubusercontent.com/LaiYanKai/EE4308/main/Tbot_install2.sh
sudo chmod +x *.sh
sudo reboot
