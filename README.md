# docker-drachtio-freeswitch-base

A minimal Freeswitch 1.6 image (539 MB) designed for applications that use only dialplan or event socket.  No lua, javascript or other scripting languages are commpiled into this image, and many of the less frequently-used modules are also not provided.

This is intended to be a base image that other Dockerfiles will reference; via ONBBUILD directives a Dockerfile can reference this image and bring in their own dialplans and sip profiles to customize the install.  See [drachtio/drachtio-freeswitch-mrf:latest](https://hub.docker.com/r/drachtio/drachtio-freeswitch-mrf) for an example of an image that builds on this as a base image.



