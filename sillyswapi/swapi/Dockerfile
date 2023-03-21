FROM python:3.10.7-slim-bullseye AS base

RUN set -x && apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates wget jq procps && \
    rm -rf /var/lib/apt/lists/*

# install rq
RUN wget -c https://github.com/dflemstr/rq/releases/download/v1.0.2/rq-v1.0.2-x86_64-unknown-linux-gnu.tar.gz -O - | tar -xz -C /bin

# copy uvicorn restart helper
COPY ./start-or-restart-uvicorn.sh /sillyswapi/start-or-restart-uvicorn.sh


FROM base

WORKDIR /sillyswapi

COPY ./pyproject.toml /sillyswapi/pyproject.toml

# use rq/jq to yoink dependencies out of pyproject.toml and install them -- doing this to not install our actual project
# since we will be syncing that over ourselves
RUN rq -t < pyproject.toml | jq -r '.["project"]["dependencies"][]' | xargs -d '\n' pip install

COPY ./swapi /sillyswapi/swapi

ENTRYPOINT ["uvicorn", "swapi.main:app"]
CMD ["--host", "0.0.0.0", "--port", "80"]
