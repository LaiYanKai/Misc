# First time setup
To record screen in ubuntu 22.04, u need to disable wayland:
1. Open the config file with:
   ```bash
   sudo nano /etc/gdm3/custom.conf
   ```
   Key in password if required.
  
2. Uncomment `WaylandEnable=false` by removing `#`.
3. `Ctrl+S` to save and `Ctrl+X` to exit.
4. Make sure you have saved everything you are working on, and run.
   ```bash
   sudo systemctl restart gdm3
   ```

5. Install ffmpeg and kazam
   ```bash
   sudo apt install ffmpeg kazam -y
   ```

# Subsequent screen recording
1. Open Kazam by searching for it from the Activities pane on the top left of the screen
2. To record screen, click on Screencast, and click Fullscreen
3. Click capture, and after 5 seconds (the default countdown), the screen will start recording.
4. 4 To finish the recording, click on the camera icon on the top right of the screen, and click "Finish recording"
6. Save the file, preferably as `in.mp4`. Do not cancel, otherwise, the video will be lost.

## Converting to Windows friendly format
7. You can find the video typically in the `~/Videos` folder.
8. Open the folder in *Files*, and rename the video you want to `in.mp4`.
9. In a terminal, cd to the `~/Videos` folder.
10. Run the following command to convert the re-encode the video into something windows can open:
    ```bash
    ffmpeg -i in.mp4 -pix_fmt yuv420p -c:a copy -movflags +faststart out.mp4
    ```
11. The output video is called `out.mp4`. You can now put out.mp4 into a Powerpoint presentation.
