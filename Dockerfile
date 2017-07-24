FROM alpine:3.4

MAINTAINER NHS Digital Delivery Centre, CIS Team. Email: HSCIC.DL-CIS@nhs.net

# Install python 3 basics
RUN apk update && \
    apk add ca-certificates && \
    apk add python3 && \
    apk add python3-dev build-base libffi-dev openssl-dev --update-cache && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -rf /usr/lib/python*/ensurepip && \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/*

# Create unprivileged user
RUN adduser -S service

ENV PYLINT_VERSION=1.6.4

RUN pip3 install pylint==$PYLINT_VERSION && \
    pip3 install coverage && \
    pip3 install tornado && \
    pip3 install mock && \
    pip3 install python-jose && \
    pip3 install cryptography && \
    pip3 install ldap3 && \
    pip3 install requests && \
    pip3 install jwcrypto  && \
    pip3 install redis && \
    pip3 install pyhcl && \
    pip3 install docker && \
    pip3 install sqlalchemy && \
    pip3 install tqdm && \
    pip3 install libxml2-dev libxslt1-dev zlib1g-dev && \
    STATIC_DEPS=true pip3 install lxml
