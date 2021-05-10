ARG BASE_IMAGE="nvidia/cuda:10.2-devel-ubuntu18.04"
FROM ${BASE_IMAGE}
WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get install -y python \
    build-essential \
    ca-certificates \
    curl \
    git \
    vim \
    wget \
    python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* 

### install dependencies
RUN pip install pandas
RUN pip install jupyterlab
RUN pip install tqdm
RUN pip install matplotlib
RUN pip install scikit-learn
RUN pip install seaborn

RUN pip install tensorflow
RUN pip install keras



WORKDIR /root


CMD jupyter lab --port=8888 --no-browser --ip=0.0.0.0 --allow-root


