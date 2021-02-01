#reinstall wifi firmware
#https://www.linuxquestions.org/questions/slackware-arm-108/raspberry-pi-3-b-wifi-nic-not-found-4175627137/
sudo apt install wireless-tools --yes
cd ~/Downloads/rpi3_wifi_firmware
rm -rf *
wget  https://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/firmware-brcm80211_20161130-3+rpt3_all.deb
ar x firmware-brcm80211_20161130-3+rpt3_all.deb
tar xvf data.tar.xz 
cd /lib/firmware/brcm/
sudo cp ~/Downloads/lib/firmware/brcm/brcmfmac43455-sdio.txt .
sudo cp ~/Downloads/lib/firmware/brcm/brcmfmac43455-sdio.bin .
sudo cp ~/Downloads/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob .
sudo rmmod brcmfmac
sudo modprobe -vvv brcmfmac
