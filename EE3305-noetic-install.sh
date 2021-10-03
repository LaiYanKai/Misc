# install husky, turtle and catkin build noetic devel 210827

# install husky noetic-devel branch
mkdir -p ~/husky/src
cd ~/husky/src
git clone https://github.com/husky/husky -b noetic-devel
cd ~/husky
catkin_make

# husky dependencies and turtle install
sudo apt update
sudo apt install ros-noetic-velodyne-description ros-noetic-lms1xx ros-noetic-robot-localization ros-noetic-interactive-marker-twist-server ros-noetic-twist-mux ros-noetic-joy ros-noetic-teleop-twist-joy ros-noetic-turtlebot3 ros-noetic-turtlebot3-gazebo --yes
echo "source ~/husky/devel/setup.bash" >> ~/.bashrc
echo "export HUSKY_GAZEBO_DESCRIPTION=$(rospack find husky_gazebo)/urdf/description.gazebo.xacro" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
source ~/.bashrc

# for catkin build
sudo apt install python3-catkin-tools --yes
