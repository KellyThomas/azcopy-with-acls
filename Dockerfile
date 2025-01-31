FROM ubuntu:latest
LABEL org.opencontainers.image.source https://github.dev/dbca-wa/azcopy-with-acls

WORKDIR /usr/local/bin
ENV PYTHONUNBUFFERED TRUE
RUN apt-get -y update && apt-get -y install curl python3 lz4 pv && apt-get clean
RUN curl -L https://aka.ms/downloadazcopy-v10-linux -o azcopy.tar.gz && \
    tar xvzf azcopy.tar.gz --strip-components=1 && rm azcopy.tar.gz
COPY sync.py .

CMD ["/usr/local/bin/sync.py"]
