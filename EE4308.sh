#installs stuff for EE4308 projects and labs
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl --yes
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential ros-noetic-turtlebot3-* ros-noetic-geographic-msgs --yes
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc
# does not install hector. Use luminus' lighter version. Otherwise, fuller version available at: https://github.com/tu-darmstadt-ros-pkg/hector_quadrotor
sudo rosdep init
rosdep update
