FROM python:3.10

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        wget \
        git \
        ffmpeg \
        build-essential \
        pkg-config \
        neofetch \
        apt-utils \
        libmediainfo0v5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip3 install -U pip && \
    pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "start"]