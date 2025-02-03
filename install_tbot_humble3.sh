set -exo pipefail

# build rplidar
mkdir -p ~/rplidar/src
cd ~/rplidar/src
git clone -b ros2 https://github.com/Slamtec/rplidar_ros.git
cd ~/rplidar
colcon build --symlink-install --parallel-workers 2
echo 'source ~/rplidar/install/setup.bash' >> ~/.bashrc
source ~/rplidar/install/setup.bash

# rplidar udev rules
source ~/rplidar/src/rplidar_ros/scripts/create_udev_rules.sh

# build tbot
cd ~/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup/launch
wget https://raw.githubusercontent.com/LaiYanKai/Misc/main/robot_c1.launch.py
cd ~/turtlebot3_ws
colcon build --symlink-install --parallel-workers 2
