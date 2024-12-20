#FROM nvidia/cuda:12.3.2-base-ubuntu22.04
FROM nvidia/cuda:12.6.1-base-ubuntu22.04

WORKDIR /app/analysis

RUN apt-get upgrade -y && apt-get update -y && \
    apt-get install -y python3-pip && pip3 install --upgrade pip

RUN apt-get install npm nodejs -y && \
    npm install -g configurable-http-proxy && \
    pip3 install jupyterhub && \
    pip3 install --upgrade notebook && \
    pip3 install pandas scipy matplotlib && \
    pip3 install "dask[distributed,dataframe]" && \   
    pip3 install dask_labextension && \
    pip3 install torch torchvision torchaudio
    
RUN apt-get update -y && \
    apt install file -y && \
    apt --fix-broken install


RUN apt-get install gdal-bin --fix-missing -y && \
    apt-get install libgdal-dev --fix-missing -y


RUN useradd admin -s /bin/bash && echo admin:change.it! | chpasswd && mkdir /home/admin && chown admin:admin /home/admin


COPY ./jupyterhub_config.py /app/analysis/jupyterhub_config.py
COPY ./create-new-user.py /app/analysis/create-new-user.py


CMD ["jupyterhub", "--ip=0.0.0.0", "--port=8000", "--no-ssl"]


EXPOSE 8000
