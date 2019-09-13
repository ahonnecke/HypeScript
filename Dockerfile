FROM python:3.6-slim-stretch as base

ENV AWS_PROFILE web
ENV AWS_SDK_LOAD_CONFIG 1
ENV LANG "en_US.UTF-8"
ENV LANG C.UTF-8
ENV LC_ALL "en_US.UTF-8"
ENV LC_ALL C.UTF-8
ENV PATH="$PATH:./node_modules/.bin"
ENV PYTHONUNBUFFERED 1
ENV SLS_DEBUG true

RUN apt-get update && \
        apt-get install -yq python3-dev \
        && apt-get clean

WORKDIR /app
COPY ./requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

#CMD ["pipenv", "install"]
