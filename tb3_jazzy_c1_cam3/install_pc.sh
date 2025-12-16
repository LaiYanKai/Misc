sudo apt update

# INSTALL TERMINATOR
sudo apt install terminator -y

# INSTALL CODE
sudo snap install --classic code
# Install VSCode extension: (1) Robotics Development Environment (by Ranch Robotics, select the one with "2" in the round icon)
# Install VSCode extension: (2) Remote Development (by Microsoft, select the one with "4" in the round icon)

# INSTALL ROS
sudo apt install software-properties-common -y
sudo add-apt-repository universe
# press ENTER
sudo apt update
sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
sudo apt update 
sudo apt upgrade -y
sudo apt install ros-jazzy-desktop ros-dev-tools ros-jazzy-ros-gz python3-pip ros-jazzy-turtlebot3-gazebo ros-jazzy-turtlebot3-teleop ros-jazzy-turtlebot3-cartographer ros-jazzy-nav2-map-server ros-jazzy-turtlebot3-navigation2 ros-jazzy-nav2-route iw -y
sudo rosdep init
rosdep update

# ADD ROS TO BASHRC
echo 'source /opt/ros/jazzy/setup.bash' >> $HOME/.bashrc
echo 'export TURTLEBOT3_MODEL=burger' >> $HOME/.bashrc
echo 'export ROS_DOMAIN_ID=1' >> $HOME/.bashrc
source $HOME/.bashrc # this will not work if this script is run with "./". Just cut and paste everything here.

# INSTALL SOFTWARE FOR 5GHZ HOTSPOT
DIS_RDM_CONF=/etc/NetworkManager/conf.d/90-disable-randomization.conf
sudo sh -c "echo '[device-mac-randomization]' > $DIS_RDM_CONF"
sudo sh -c "echo 'wifi.scan-rand-mac-address=no' >> $DIS_RDM_CONF"
# sudo apt install iw -y
sudo iw reg set SG
sudo sh -c "echo 'REGDOMAIN=SG' > /etc/default/crda"

# INSTALL ULTRALYTICS
pip install ultralytics "numpy<2" --break-system-packages # !TODO: use Venv in the future

# CLONE TB3_YOLO
cd $HOME
git clone https://github.com/laiyankai/tb3_yolo
cd $HOME/tb3_yolo
source /opt/ros/jazzy/setup.bash
colcon build --symlink-install

nano $HOME/.bashrc
