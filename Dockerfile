# set the base image 
FROM python:3.8-slim-buster

# File Author / Maintainer
MAINTAINER CogAI

#add project files to the usr/src/app folder
ADD . /usr/src/app

#set directoty where CMD will execute 
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /usr/src/app
COPY . /usr/src/app


# Get pip to download and install requirements:
RUN pip install -U pip setuptools
RUN pip install ez_setup
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose ports
EXPOSE 8000

CMD [ "python3", "manage.py","runserver", "0.0.0.0:8000"]
