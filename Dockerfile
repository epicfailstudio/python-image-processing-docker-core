FROM python:3.11-bookworm

RUN apt-get update
RUN apt-get install -y libmcrypt-dev libc-client-dev libkrb5-dev zlib1g-dev libpq-dev libcurl3-dev default-mysql-client libmagickwand-dev --no-install-recommends

RUN apt-get install -y libzip-dev libonig-dev

RUN apt-get install -y curl git zip unzip less vim procps
RUN apt-get install -y cron wget dnsutils net-tools libc-bin locales gnupg

# Install python3 and dependencies needed for OCR and document processing
RUN apt-get install -y libxml2-dev libxslt1-dev antiword poppler-utils zlib1g-dev build-essential libssl-dev libffi-dev libblas-dev libatlas-base-dev unrtf
RUN apt-get install -y tesseract-ocr tesseract-ocr-all
RUN apt-get install -y flac ffmpeg lame sox swig
RUN apt-get install -y libmad0 libsox-fmt-mp3 libjpeg-dev libpulse-dev libasound2-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev
RUN apt-get install -y python3-tk python3-numpy

RUN pip install git+https://github.com/jbarlow83/OCRmyPDF.git@v15.4.4
RUN apt-get install -y pngquant

RUN apt install -y libpoppler-cpp-dev pkg-config

# Install ZBar
RUN apt-get install -y zbar-tools libzbar-dev

# Copy and Install python PIP packages
COPY ./assets/requirements.txt /root/requirements.txt
RUN pip install --no-cache-dir -r /root/requirements.txt

RUN apt-get install -y openjdk-17-jre

RUN apt-get install -y ghostscript
RUN apt-get install -y libleptonica-dev
RUN apt-get install -y jbig2dec

WORKDIR /tmp

RUN git clone https://github.com/agl/jbig2enc

WORKDIR /tmp/jbig2enc
RUN bash ./autogen.sh
RUN ./configure && make
RUN make install

WORKDIR /srv/pyapp

EXPOSE 5123

ENTRYPOINT [ "gunicorn" ]
CMD ["-w", "2", "-b", "0.0.0.0:5123", "-k", "uvicorn.workers.UvicornWorker", "wsgi"]
