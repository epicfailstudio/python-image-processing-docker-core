FROM python:3.9-buster

RUN apt-get update
RUN apt-get install -y libmcrypt-dev libc-client-dev libkrb5-dev zlib1g-dev libpq-dev libcurl3-dev \
    default-mysql-client libmagickwand-dev --no-install-recommends

RUN apt-get install -y libzip-dev
RUN apt-get install -y libonig-dev

RUN apt-get install -y curl git zip unzip less vim procps
RUN apt-get install -y cron wget dnsutils net-tools libc-bin locales gnupg

# Install python3 and dependencies needed for OCR and document processing
RUN apt-get install -y libxml2-dev libxslt1-dev antiword poppler-utils zlib1g-dev build-essential libssl-dev libffi-dev libblas-dev libatlas-base-dev
RUN apt-get install -y unrtf
RUN apt-get install -y tesseract-ocr
RUN apt-get install -y flac
RUN apt-get install -y ffmpeg
RUN apt-get install -y lame
RUN apt-get install -y libmad0
RUN apt-get install -y libsox-fmt-mp3
RUN apt-get install -y sox
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y swig
RUN apt-get install -y libpulse-dev
RUN apt-get install -y libasound2-dev

RUN apt-get install -y libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev
RUN apt-get install -y python3-tk python3-numpy

RUN apt-get install -y ocrmypdf pngquant

# Install ZBar
RUN apt-get install -y zbar-tools libzbar-dev

# Copy and Install python PIP packages
COPY ./assets/requirements.txt /root/requirements.txt
RUN pip install --no-cache-dir -r /root/requirements.txt

RUN apt-get install -y tesseract-ocr-slk
RUN apt-get install -y openjdk-11-jre

WORKDIR /srv/pyapp

CMD [ "python", "./app.py" ]
