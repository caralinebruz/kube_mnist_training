FROM --platform=linux/amd64 python:3.10-slim-bullseye

WORKDIR /app

ADD mnist.py /app/
ADD requirements.txt /app/

RUN mkdir /model
VOLUME /model
ENV MODEL_DIR /model

RUN pip3 install -r requirements.txt


CMD [ "python", "mnist.py", "--save-model", "--no-mps", "--epochs", "1"]



# docker build -t training .
# docker run -p 8001:8001 -it training


