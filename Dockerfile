FROM docker.io/continuumio/miniconda3

RUN apt-get -y update

RUN /opt/conda/bin/conda install jupyter -y --quiet

