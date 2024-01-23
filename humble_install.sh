set -e # stop immediately if got problem

# update and upgrade, terminator installation
sudo apt update && sudo apt upgrade -y
sudo apt install terminator -y

# ros installation
locale # feedback only.
sudo apt install software-properties-common
sudo add-apt-repository universe # Press [ENTER]
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade -y
sudo apt install ros-humble-desktop-full -y
sudo apt install ros-humble-gazebo-* ros-humble-cartographer ros-humble-cartographer-ros ros-humble-navigation2 ros-humble-nav2-bringup ros-humble-dynamixel-sdk ros-humble-turtlebot3-* -y

# write to .bashrc
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=30 #TURTLEBOT3" >> ~/.bashrc
echo "source /usr/share/gazebo/setup.sh #Required for some machines to launch gz properly" >> ~/.bashrc
source ~/.bashrc
