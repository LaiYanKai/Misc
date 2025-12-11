#!/bin/bash
# assume Rpi 5, 4GB/8GB/16GB
set -exo pipefail

mkdir -p $HOME/opencr_update
cd $HOME/opencr_update
export OPENCR_PORT=/dev/ttyACM0  
export OPENCR_MODEL=burger
# uncomment the following to update
# wget -O https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2
# rm -rf opencr_update
# tar -xvf opencr_update.tar.bz2
cd $HOME/opencr_update/opencr_update  
./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr  
cd $HOME