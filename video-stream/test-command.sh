# make a video from cam
libcamera-vid -t 0 --inline --width 640 --height 480 --framerate 15  -o - | ffmpeg -i pipe:0 -c copy video2.mp4

# test camera
libcamera-vid --list-cameras

# Record a 1s video
libcamera-vid -t 10000 -o test.h264
