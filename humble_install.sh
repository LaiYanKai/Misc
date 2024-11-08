set -euxo pipefail

# update and upgrade
sudo apt update && sudo apt upgrade -y

# ros installation
# locale # feedback only.
sudo apt install software-properties-common terminator -y
sudo add-apt-repository universe -y #may need to press [ENTER]
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade -y
sudo apt install terminator ros-humble-desktop-full ros-humble-turtlebot3-* git ros-dev-tools ros-humble-rmw-cyclonedds-cpp -y

# write to .bashrc
# USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
USER_BASHRC=$HOME/.bashrc
echo "source /opt/ros/humble/setup.bash" >> $USER_BASHRC
echo "export TURTLEBOT3_MODEL=burger" >> $USER_BASHRC
echo "export ROS_DOMAIN_ID=30 #TURTLEBOT3" >> $USER_BASHRC
echo "source /usr/share/gazebo/setup.sh #Required for some machines to launch gz properly" >> $USER_BASHRC
echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
echo "chmod 0700 /run/user/1000/" >> ~/.bashrc # for WSL2 users

source ~/.bashrc
