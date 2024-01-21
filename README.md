# Image Processing Docker Core (Python)

[![Build Status](https://jenkins.epicfail.dev/buildStatus/icon?job=Docker+-+Python+Image+Processing+Core)](https://jenkins.epicfail.dev/job/Docker%20-%20Python%20Image%20Processing%20Core/)

Purpose of this image is to run Rest API with functionality to Compress-ing, OCR-ing or other way processing images and videos.
Image has preinstalled python3 and packages such as `tesseract-ocr`, `zbar`, `opencv` or `ffmpeg`

## Core image
Based on `python/3.11-bullseye` docker image


## Default working directory and script
To run your application you can map your volume to `/srv/pyapp` with main in `run.py`
