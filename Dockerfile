FROM python:3.10-slim-bullseye

RUN apt-get update &&
  apt-get -y upgrade

ENV PORT 8001
EXPOSE $PORT

WORKDIR /app

ADD mnist.py /app/
ADD requirements.txt /app/

RUN pip3 install -r requirements.txt

RUN mkdir /app/data
VOLUME /app/data
VOLUME /app


CMD [ "python", "mnist.py", "--save-model", "--no-mps", "--epochs", "1"]



# docker build -t training .
# docker run -p 8001:8001 -it training


