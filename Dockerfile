FROM nikolaik/python-nodejs:python3.9-nodejs22

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        wget \
        git \
        yasm \
        build-essential \
        pkg-config \
        neofetch \
        apt-utils \
        libmediainfo0v5 \
        libswresample-dev \
        libfdk-aac-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --branch release/7.0 https://github.com/FFmpeg/FFmpeg.git /ffmpeg && \
    cd /ffmpeg && \
    ./configure --enable-gpl --enable-libx264 --enable-libx265 --enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus --enable-nonfree && \
    make && \
    make install && \
    ldconfig && \
    cd / && \
    rm -rf /ffmpeg

ENV PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

COPY . /app/
WORKDIR /app/

RUN pip3 install -U pip && \
    pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "start"]