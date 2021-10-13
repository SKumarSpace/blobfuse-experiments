FROM bitnami/minideb:latest

RUN install_packages ca-certificates wget
RUN update-ca-certificates

WORKDIR /downloads

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN install_packages blobfuse libcurl4-gnutls-dev

WORKDIR /
RUN rm -rf /downloads
RUN mkdir /scripts
COPY ./mount-blobfuse.sh ./scripts

RUN chmod +x /scripts/mount-blobfuse.sh
ENTRYPOINT ["sh", "/scripts/mount-blobfuse.sh"]