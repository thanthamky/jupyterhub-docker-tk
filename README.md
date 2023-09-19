# jupyterhub-docker-tk

The project forked from rancavail/jupyterhub-docker from gitlabs. His peoject had done creatable users jupyterhub server based on 16.04 ubuntu version. because of this, available python version was reached only 3.6.9 as latest.

This project modifies his project to upgrade based ubuntu version, python version and jupyter hub version up to latest.

To implement this project, clone the peoject and use docker compose to build up and run server using this command

## Prequisition

- From fresh installtion of Ubuntu 22.04 install Nvidia CUDA support
https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local

- Install Nvidia-Docker support
https://github.com/d1egoprog/docker-tensorflow-gpu-jupyter/tree/main/config-nvidia-ubuntu

CUDA installation completion check by ```nvidia-smi```, information of youe GPU should be there

## Installation

```
mkdir jupyterhub-docker-tk
git clone https://github.com/thanthamky/jupyterhub-docker-tk.git jupyterhub-docker-tk
cd jupyterhub-docker-tk
docker-compose up -d --build
```

the jupyter hub server will expose at port 8000

## First meet

go to your host with port 8000 (if you did not modify in docker-compose.yml) 

```
http://localhost:8000/
```

and logging in using **admin** username with **change.it!** password. Then, your server will start

## Add new user
Use your admin account and go to **Admin** menu in File > Control Hub Panel, click at Add user. Logging out from your admin account, and Log in to a new user name with default password **remember.change.it**. After that, go to user terminal (sh interface). type

```
$ passwd
Changing password for admin.
(current) UNIX password:
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
$

```
