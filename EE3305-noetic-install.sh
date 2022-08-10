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
sudo apt install ros-noetic-velodyne-description ros-noetic-lms1xx ros-noetic-robot-localization ros-noetic-interactive-marker-twist-server ros-noetic-twist-mux ros-noetic-joy ros-noetic-teleop-twist-joy ros-noetic-turtlebot3-* --yes 

# install husky noetic-devel branch
rm -rf ~/husky
mkdir -p ~/husky/src
cd ~/husky/src
sudo apt install git --yes
git clone https://github.com/husky/husky -b noetic-devel # use melodic-devel if noetic gives issues
cd ~/husky
source ~/.bashrc
catkin_make
cd ~

# husky dependencies and turtle install
echo "source ~/husky/devel/setup.bash" >> ~/.bashrc
echo "export HUSKY_GAZEBO_DESCRIPTION=$(rospack find husky_gazebo)/urdf/description.gazebo.xacro" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc
