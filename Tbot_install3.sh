#Install ROS Melodic Morenia

#sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# Install ROS Melodic
wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic_rp3.sh
chmod 755 ./install_ros_melodic_rp3.sh
bash ./install_ros_melodic_rp3.sh
sudo apt install ros-melodic-ros-base --yes
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential --yes
sudo rosdep init
rosdep update
#Install and build TurtleBot3 packages. 
sudo apt update
sudo apt install ros-melodic-rosserial-python ros-melodic-tf --yes
mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/src
sudo apt install ros-melodic-hls-lfcd-lds-driver --yes
sudo apt install ros-melodic-turtlebot3-msgs --yes
sudo apt install ros-melodic-dynamixel-sdk --yes
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
cd ~/catkin_ws/src/turtlebot3
rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
cd ~/catkin_ws/
echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
source ~/.bashrc
cd ~/catkin_ws && catkin_make -j1
echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
source ~/.bashrc

# USB Port Setting
rosrun turtlebot3_bringup create_udev_rules

# OpenCR
sudo dpkg --add-architecture armhf
sudo apt update
sudo apt install libc6:armhf --yes

export OPENCR_PORT=/dev/ttyACM0
export OPENCR_MODEL=burger
rm -rf ./opencr_update.tar.bz2

wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 
tar -xvf opencr_update.tar.bz2 

cd ./opencr_update
./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
cd ~