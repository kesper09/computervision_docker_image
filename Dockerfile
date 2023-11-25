ARG BASE_IMAGE=ubuntu:20.04
FROM python:3.6

RUN python3 -m pip install --upgrade pip

RUN pip3 install torch torchvision torchaudio

WORKDIR /jupyter

RUN pip install jupyter -U && pip install jupyterlab
RUN sudo apt-get install git

FROM tensorflow/tensorflow:latest-gpu

WORKDIR /internship

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter","lab","--ip=0.0.0.0","--allow-root","--no-browser"]