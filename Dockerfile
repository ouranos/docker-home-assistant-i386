FROM i386/python:3.5-alpine

VOLUME /config

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN set -ex \
  && apk add --no-cache --virtual .python-rundeps \
    build-base \
    linux-headers \
    libxml2-dev \
    libxslt-dev

# colorlog cython
RUN pip3 install --no-cache-dir homeassistant \
  && rm -rf ~/.cache

CMD [ "hass", "--config", "/config" ]
