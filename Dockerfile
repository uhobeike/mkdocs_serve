FROM python:3.9-alpine

ARG APT_INSTALL_PKGS
ARG PIP_INSTALL_PKGS

WORKDIR /app

RUN apt update && \
    apt install -y $APT_INSTALL_PKGS && \
    : "remove cache" && \
    sudo apt-get autoremove -y -qq && \
    sudo rm -rf /var/lib/apt/lists/*

RUN pip install $PIP_INSTALL_PKGS 

EXPOSE 8000

ENTRYPOINT ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
