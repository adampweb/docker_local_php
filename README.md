# Basic PHP-FPM image <br/>(version: 8.0.10)

## Introduction

The source of this build is the [official PHP-FPM (php:8.0.10-fpm-buster) image](https://hub.docker.com/_/php)
from [Docker Hub](https://hub.docker.com/). I copy the original **php.ini** to the image because this
mode facilitates later modification. But I always install a CLI text editor
(e.g.: [nano](https://www.nano-editor.org/)) into my Docker projects.

## How to use
I did not plan this for direct use, but you can create a stand-alone project with it. I did plan it as a source image
of more customized projects e.g.: combined with Nginx, Apache, etc... container with [Docker-Compose](https://docs.docker.com/compose/)
for web-applications.