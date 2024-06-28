FROM python:3.9.2

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        wget \
        yasm \
        build-essential \
        pkg-config \
        neofetch \
        apt-utils \
        libmediainfo0v5 \
        libx264-dev \
        libx265-dev \
        libvpx-dev \
        libmp3lame-dev \
        libopus-dev \
        libavformat-dev \
        libavcodec-dev \
        libavdevice-dev \
        libavutil-dev \
        libavfilter-dev \
        libswscale-dev \
        libswresample-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ffmpeg && cd /ffmpeg && \
    wget https://ffmpeg.org/releases/ffmpeg-4.6.2.tar.bz2 && \
    tar -xjf ffmpeg-4.6.2.tar.bz2 && \
    cd ffmpeg-4.6.2 && \
    ./configure --enable-gpl --enable-libx264 --enable-libx265 --enable-libvpx --enable-libfdk-aac --enable-libmp3lame --enable-libopus && \
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