#!/bin/bash

# Stop and remove the existing container if it exists
docker stop rtsp-server
docker rm rtsp-server

# Run the new container
docker run --name rtsp-server \
  --restart unless-stopped \
  -p 8554:8554 \
  --network host \
  -v /home/tongw/Desktop/ip_cam/mediamtx.yml:/mediamtx.yml \
  bluenviron/mediamtx
