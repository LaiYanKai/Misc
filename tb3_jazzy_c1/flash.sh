#!/bin/bash
# assume Rpi 5, 4GB/8GB/16GB
set -exo pipefail

mkdir -p $HOME/opencr_update
cd $HOME/opencr_update
# comment the following if the $HOME/opencr_update/opencr_update folder already exists with the most recent firmware
wget -O opencr_update.tar.bz2 https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2
rm -rf opencr_update
tar -xvf opencr_update.tar.bz2

cd $HOME/opencr_update/opencr_update  
./update.sh /dev/ttyACM0 burger.opencr