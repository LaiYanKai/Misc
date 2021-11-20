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
