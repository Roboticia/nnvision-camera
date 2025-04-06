# make a video from cam
libcamera-vid -t 0 --inline --width 640 --height 480 --framerate 15  -o - | ffmpeg -i pipe:0 -c copy video2.mp4

# test camera
libcamera-vid --list-cameras

# Record a 1s video
libcamera-vid -t 10000 -o test.h264

# record an image
libcamera-still --awb off  -o image.jpg
libcamera-jpeg -o test.jpg

# record in IR mode
libcamera-still --awbgains 0,0 --saturation 0 -t 2000 -o image.jpg
libcamera-vid --awbgains 0,0 --saturation 0 -t 5000 --output ir_video.h264

# configure rpi zero
sudo nano /boot/firmware/config.txt
#Find the line: camera_auto_detect=1, update it to:
camera_auto_detect=0
#Find the line: [all], add the following item under it:
dtoverlay=ov5647
#Save and reboot.