FROM ubuntu:22.04

WORKDIR /app/analysis

RUN apt-get upgrade -y && apt-get update -y && apt-get install -y python3-pip && pip3 install --upgrade pip3
RUN apt-get install npm nodejs -y && \
    npm install -g configurable-http-proxy && \
    pip3 install jupyterhub && \
    pip3 install --upgrade notebook && \
    pip3 install pandas scipy matplotlib && \
    pip3 install "dask[distributed,dataframe]" && \   
    pip3 install dask_labextension && \
    useradd admin && echo admin:change.it! | chpasswd && mkdir /home/admin && chown admin:admin /home/admin

COPY ./jupyterhub_config.py /app/analysis/jupyterhub_config.py
COPY ./create-new-user.py /app/analysis/create-new-user.py

CMD ["jupyterhub", "--ip=0.0.0.0", "--port=8000", "--no-ssl"]

EXPOSE 8000
