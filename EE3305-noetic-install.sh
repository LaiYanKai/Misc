# install husky, turtle and catkin build noetic devel 220810
# if there are problems with catkin_make, run script with "source EE3305-noetic-install.sh" instead of ./EE3305-noetic-install.sh

# install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl --yes
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full --yes
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential --yes # build dependencies
# husky and turtlebot dependencies
sudo apt install ros-noetic-husky-gazebo ros-noetic-turtlebot3-* --yes 

# write to .bashrc so no need to keep typing this
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc
