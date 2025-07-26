#!/bin/bash

width=1920
height=1080
framerate=30
rtsp_url=rtsp://10.0.0.62:8554/cam

while true; do
    ffmpeg \
        -re \
        -f lavfi \
        -i "color=c=blue:s=${width}x${height}:r=${framerate}" \
        -an \
        -c:v libx265 \
        -preset ultrafast \
        -tune zerolatency \
        -f rtsp \
        -rtsp_transport tcp \
        $rtsp_url

    echo "Streaming crashed or exited, restarting in 5s..."
    sleep 5
done
