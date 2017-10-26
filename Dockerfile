FROM alpine

RUN apk update && \
	apk upgrade  && \
	apk add python3 \
	apk add py3-pip \
  	rm -rf /var/cache/apk/*

RUN pip3 install django

WORKDIR /home/docker/code/

RUN django-admin startproject alpinedjango

RUN python3 alpinedjango/manage.py migrate

EXPOSE 8000

CMD python3 alpinedjango/manage.py runserver 0.0.0.0:8000
