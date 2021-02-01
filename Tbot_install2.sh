systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo apt-get update
sudo apt-get upgrade --yes
sudo apt install wireless-tools --yes
# restore wifi
./Tbot_reinstall_wifi.sh
sudo reboot