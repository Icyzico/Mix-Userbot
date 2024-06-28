FROM python:3.9

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        neofetch \
        apt-utils \
        libmediainfo0v5 \
        libavformat-dev \
        libavcodec-dev \
        libavdevice-dev \
        libavutil-dev \
        libavfilter-dev \
        libswscale-dev \
        libswresample-dev \
        build-essential \
        pkg-config \
        wget \
        yasm \
        libx264-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ffmpeg && cd /ffmpeg && \
    wget https://ffmpeg.org/releases/ffmpeg-4.6.2.tar.bz2 && \
    tar -xjf ffmpeg-4.6.2.tar.bz2 && \
    cd ffmpeg-4.6.2 && \
    ./configure --enable-gpl --enable-libx264 && \
    make && \
    make install && \
    cd / && \
    rm -rf /ffmpeg

COPY . /app/
WORKDIR /app/

RUN pip3 install -U pip && \
    pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "start"]