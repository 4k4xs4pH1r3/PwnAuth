FROM python:3.11-rc-slim

ENV PYTHONUNBUFFERED=1
ENV OAUTHLIB_RELAX_TOKEN_SCOPE=1
ENV DOCKER_CONTAINER=1
ENV DJANGO_ENV=prod
ENV DJANGO_SITE=localhost
ENV ERROR_LOG=/var/log/oauth/error.log
ENV AUDIT_LOG=/var/log/oauth/audit.log
ENV DEBUG_LOG=/var/log/oauth/debug.log
ENV SECRET_KEY=CHANGEME
RUN mkdir /opt/app
RUN mkdir /opt/sock
RUN mkdir /var/log/oauth
WORKDIR /opt/app
COPY ./app /opt/app

RUN pip3 install -r /opt/app/requirements.txt
RUN pip3 install uwsgi

CMD ["uwsgi", "--ini", "/opt/app/uwsgi.ini"]
