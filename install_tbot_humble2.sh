# may require input at sudo apt upgrade
sudo apt update
sudo add-apt-repository universe -y # press enter
sudo apt install software-properties-common curl --yes
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# download tbot stuff
mkdir -p ~/turtlebot3_ws/src 
cd ~/turtlebot3_ws/src
git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b ros2-devel https://github.com/ROBOTIS-GIT/ld08_driver.git
cd ~/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup/launch/
curl -O https://raw.githubusercontent.com/LaiYanKai/Misc/main/robot_ee4308.launch.py
cd ~/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup/param/
curl -O https://raw.githubusercontent.com/LaiYanKai/Misc/main/install_tbot_humble3.sh
cd ~
curl -O https://raw.githubusercontent.com/LaiYanKai/Misc/main/robot.sh
chmod +x *.sh
rm -rf ./opencr_update.tar.bz2
wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2

# install packages
sudo apt update
sudo apt upgrade --yes

sudo apt install ros-humble-ros-base python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential ros-humble-hls-lfcd-lds-driver ros-humble-turtlebot3-msgs ros-humble-dynamixel-sdk libudev-dev --yes

sudo dpkg --add-architecture armhf
sudo apt update
sudo apt install libc6:armhf --yes

reboot
