#!/bin/bash

width=1920
height=1080
framerate=25
rtsp_url=rtsp://10.0.0.62:8554/cam

while true; do
    rpicam-vid \
        --codec h264 \
        --width $width \
        --height $height \
        --framerate $framerate \
        --timeout 0 \
        --nopreview \
        -g 10 \
        --bitrate 4500000 \
        -o - | \
    ffmpeg \
        -f h264 \
        -framerate $framerate \
        -i - \
        -an \
        -c:v copy \
        -f rtsp \
        -rtsp_transport tcp \
        $rtsp_url

    echo "Streaming crashed or exited, restarting in 5s..."
    sleep 5
done
