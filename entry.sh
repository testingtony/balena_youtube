#!/bin/bash -xv

echo Live-stream secret: $YOUTUBE_KEY

raspivid -o - ${CAM_OPTIONS:- -ae 32,0x00,0x8080FF -a 12 --mode 4} -t 0  -b 8000000 -g 40 | ffmpeg -nostats -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -thread_queue_size 1024 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f flv -r ${FPS:-25} rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY


/bin/sleep 3m
