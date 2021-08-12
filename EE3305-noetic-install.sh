# install husky noetic devel 210812
cd ~
mkdir husky
cd husky
mkdir src
cd src
git clone https://github.com/husky/husky
cd ..
catkin_make
sudo apt install ros-noetic-lms1xx ros-noetic-robot-localization ros-noetic-interactive-marker-twist-server ros-noetic-twist-mux ros-noetic-joy ros-noetic-teleop-twist-joy --yes
echo "source ~/husky/devel/setup.bash" >> ~/.bashrc
echo "export HUSKY_GAZEBO_DESCRIPTION=$(rospack find husky_gazebo)/urdf/description.gazebo.xacro" >> ~/.bashrc
source ~/.bashrc

sudo apt install python3-catkin-tools --yes
cd ~
