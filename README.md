BALENA_YOUTUBE
==============

Stream video from a Raspberry PI camera to YouTube live streamingm built as a [Balena](https://www.balena.io/) application.

Requirements
------------

The Balena and YouTube websites are far better than anything I could do at explaining how to do get these.

* Raspberry PI with camera - My Pi Zero can just about handle the workload, but somewhere it keeps buffering, the Pi3 is a lot sharper,
* A Balena.io account with an application created with your Pi as a device,
* A YouTube account set up for live streaming - and the stream key.

Running
-------

1. Configure the Balena appliction (see below),
2. Clone this repository,
3. Add the remote details for your Balena application,
4. Push it to Balena.

It'll take a short while to compile and a long while to download to the Pi, but by the end you should see in YouTube's streaming studio _Stream Health_ setting the status show there's a connection and data coming in.

Configuring the Balena application (mandatory)
----------------------------------

1. In the applications *Fleet Configuration*
   1. set the **Define device GPU memory in megabytes** option to **128**
   2. Add a *Custom configuration variables* named **BALENA_HOST_CONFIG_start_x** with a value of **1**
2. In the device *Device Variables*
   1. Add a variable named **YOUTUBE_KEY** with the value of the YouTube stream key.

Other configuration (optional)
-------------------

You can play with the following Environment variables for the fleet or device,

* *CAM_OPTIONS* (default `--mode 4`) can be used to change the options passed to [`raspivid`](https://www.raspberrypi.org/documentation/raspbian/applications/camera.md)  Try `-ae 32,0x00,0x8080FF -a 12 --mode 4`
* *BITRATE* (default 8000000) can change the bitrate that the camera outputs data, I've not notice it being helpful to change from the detault
* *FPS* (default 25) is the number of frames per second sent from the PI to YouTube, you could reduce it try to reduce the network traffic.

Credits
-------

Everything is based of the [original work by Alex Ellis](https://blog.alexellis.io/live-stream-with-docker/)


