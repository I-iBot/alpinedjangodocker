FROM alpine:latest

RUN apk update && \
	apk upgrade  && \
	apk add python3 \
	python3-dev \
	build-base \
	linux-headers \
	pcre-dev \
	py3-pip \
	gcc

RUN pip3 install uwsgi
RUN pip3 install django

WORKDIR /home/docker/code/

RUN django-admin startproject alpinedjango

RUN python3 alpinedjango/manage.py migrate

EXPOSE 8005

CMD python3 alpinedjango/manage.py runserver 0.0.0.0:8005
