# CI pipeline for Ardupilot Docker images

I wanted to pre-build a docker image for Ardupilot Simulator In The Loop (SITL). This repo contains the Concourse CI pipeline that triggers and builds the image.

New images are built for every new Ardupilot Git commit, or if new Ubuntu Bionic docker image is published.