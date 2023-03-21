FROM python:3.10.7-slim-bullseye

WORKDIR /sillyswapi

COPY ./client ./client
COPY ./setup.py .
COPY ./requirements.txt .

RUN pip install --no-cache-dir --upgrade .

ENTRYPOINT ["client"]