## Raspberry Pi camera v1.3, Ubuntu 22.04.5 Server on Raspberry Pi 3B+, ROS2 Humble.
Working as of 12 December 2024.

- No changes to `/boot/firmware/config.txt` on RPi
- Install camera_ros: [camera_ros github](https://github.com/christianrauch/camera_ros) on Rpi
  ```bash
  sudo apt install ros-humble-camera-ros on Rpi.
  ```
- On Remote PC, install image_tools. RViz2 is unreliable and has a problem displaying camera images even if a static transform between `map` and `camera` exists. Not sure why there is no support for a simple static camera feed.
  ```bash
  sudo apt install image_tools
  ```
- Attach camera to Rpi before booting. Once booted, choose an appropriate `ROS_DOMAIN_ID` and stream the camera feed from the Rpi (maybe via SSH). (see available width, height and format settings in terminal output):
  ```bash
  ROS_DOMAIN_ID=8 ros2 run camera_ros camera_node --ros-args -p width:=160 -p height:=120 -p format:=BGR888
  ```
- On Remote PC, stream the picture using `image_tools`:
  ```bash
  ROS_DOMAIN_ID=8 ros2 run image_tools showimage --ros-args --remap image:=/camera/image_raw
  ```


## Deprecated (Same hardware, but Ubuntu 20.04 Server, ROS1 Noetic)
fresh installation ubuntu 20.04 Server Rpi 3B v1.2

include start_x=1 and gpu_mem=128 inside my /boot/firmware/config.txt
plug in camera to the port and restart
```
sudo reboot
sudo apt update
sudo apt upgrade
ls /dev
```
see if device video0 appears. if not idk.

```
sudo apt install libopencv-dev python3-opencv
```

python script for camera:
```
import cv2

# open camera
cap = cv2.VideoCapture('/dev/video0', cv2.CAP_V4L)

# set dimensions
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 800)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 600)

# take frame
ret, frame = cap.read()
# write frame to file
cv2.imwrite('image.jpg', frame)
# release camera
cap.release()
```

cpp script for camera:
```
#include "opencv2/opencv.hpp"

using namespace cv;

int main(int, char**)
{
    VideoCapture cap(0); // open the default camera
    if(!cap.isOpened())  // check if we succeeded
        return -1;

    Mat frame;
    cap >> frame; // get a new frame from camera
    imwrite("image0.png", frame);

    return 0;
}
```
