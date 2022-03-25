FROM alpine:latest

LABEL maintainer="Will DeBerry <willdeberry@gmail.com>"

RUN apk add --no-cache python3 py3-pip gcc python3-dev libc-dev libffi-dev make

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN mkdir -p /usr/bin/garage
COPY garage /usr/bin/garage/garage
COPY .env /usr/bin/garage/.env
COPY schedule.json /usr/bin/garage/schedule.json

ENTRYPOINT [ "/usr/bin/garage/garage", "--manage" ]
