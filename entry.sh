#!/bin/bash

CAM_OPTIONS=${CAM_OPTIONS:- --mode 4}
BITRATE=${BITRATE:- 8000000}
echo Live-stream secret: $YOUTUBE_KEY
echo Camera bitrate is ${BITRATE}
echo Camera options are ${CAM_OPTIONS}

raspivid -o -  -t 0 $CAM_OPTIONS -b ${BITRATE} -g 40 --nopreview | ffmpeg -nostats -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -thread_queue_size 1024 -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental -f flv -r ${FPS:-25} rtmp://a.rtmp.youtube.com/live2/$YOUTUBE_KEY


/bin/sleep 3m
