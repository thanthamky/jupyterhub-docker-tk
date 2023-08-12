# jupyterhub-docker-tk

The project forked from rancavail/jupyterhub-docker from gitlabs. His peoject had done creatable users jupyterhub server based on 16.04 ubuntu version. because of this, available python version was reached only 3.6.9 as latest.

This project modifies his project to upgrade based ubuntu version, python version and jupyter hub version up to latest.

To implement this project, clone the peoject and use docker compose to build up and run server using this command


```
docker-compose up -d --build
```

the jupyter hub server will expose at port 8000
