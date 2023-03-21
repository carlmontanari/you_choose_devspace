FROM python:3.10.7-slim-bullseye

RUN set -x && apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates wget jq procps curl vim iputils-ping && \
    rm -rf /var/lib/apt/lists/*

RUN wget -c https://github.com/dflemstr/rq/releases/download/v1.0.2/rq-v1.0.2-x86_64-unknown-linux-gnu.tar.gz -O - | tar -xz -C /bin

RUN pip install -U pip wheel setuptools httpx httpie ipdb

WORKDIR /sillyswapi
