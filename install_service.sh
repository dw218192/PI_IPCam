#!/bin/bash
target_file="/etc/systemd/system/rtsp-stream.service"

if [[ -f $target_file ]]; then
    echo "Service already exists"
    exit 0
fi

sudo tee $target_file > /dev/null <<EOF
[Unit]
Description=Raspberry Pi Camera RTSP Stream
After=network.target

[Service]
ExecStart=/home/tongw/Desktop/ip_cam/stream.sh
Restart=always
RestartSec=5
User=tongw
WorkingDirectory=/home/tongw/Desktop/ip_cam
TimeoutSec=30

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable rtsp-stream.service
sudo systemctl start rtsp-stream.service