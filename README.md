# Image Processing Docker Core (Python)

[![Build Status](https://jenkins.epicfail.dev/buildStatus/icon?job=Docker+-+Python+Image+Processing+Core)](https://jenkins.epicfail.dev/job/Docker%20-%20Python%20Image%20Processing%20Core/)

Purpose of this image is to run Rest API with functionality to Compress-ing, OCR-ing or other way processing images and videos.
Image has preinstalled python3 and packages such as `tesseract-ocr`, `zbar`, `opencv` or `ffmpeg`

## Core image
Based on `python/3.9-buster` docker image

### python requirements:
```ini
PyPDF2
EbookLib==0.16
pocketsphinx==0.1.15
textract
pypng
zbar-py
pillow
qrtools
pdf2image
opencv-python
opencv-contrib-python
tabula-py
ocrmypdf
pymongo
```

## Default working directory and script
To run your application you can map your volume to `/srv/pyapp` with main in `app.py`
