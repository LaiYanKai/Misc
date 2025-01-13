# build rplidar
mkdir -p ~/rplidar/src
cd ~/rplidar/src
git clone -b ros2 https://github.com/Slamtec/rplidar_ros.git
cd ~/rplidar
colcon build --symlink-install --parallel-workers 2
source ~/rplidar/install/setup.bash

# build tbot
cd ~/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup/launch
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/robot_c1.launch.py
cd ~/turtlebot3_ws
colcon build --symlink-install --parallel-workers 2
