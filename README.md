# Docker image to run samtools 1.10 in Ubuntu 18.04

Download Dockerfile in an empty directory on your local machine
***

Build an image from Dockerfile with:

$ docker build -t samtools:1.10 .

***
Run the container using

$ docker run --rm -it samtools:1.10 --help
