systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo apt-get update
sudo apt-get upgrade --yes
sudo reboot