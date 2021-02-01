sudo apt update
sudo apt upgrade --yes
sudo wget -O /etc/apt/apt.conf.d/20auto-upgrades https://raw.githubusercontent.com/LaiYanKai/EE4308/main/20auto-upgrades
sudo apt install wireless-tools --yes
# restore wifi
./Tbot_reinstall_wifi.sh
sudo reboot