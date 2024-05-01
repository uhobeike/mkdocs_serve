FROM python:3.9-alpine

ARG PIP_INSTALL_PKGS

WORKDIR /app

RUN pip install PIP_INSTALL_PKGS 

EXPOSE 8000

ENTRYPOINT ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
