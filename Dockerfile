FROM ubuntu:18.04

ENV SAMTOOLS_VERSION 1.10

# update package manager & build essentials
RUN apt-get update \
    && apt-get install --yes build-essential

# install dependency required by samtools
RUN apt-get install --yes wget make libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev

# install samtools
RUN mkdir /SOFT/
RUN cd /SOFT/ \
    && wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
    && tar xvjf samtools-${SAMTOOLS_VERSION}.tar.bz2 \
    && cd samtools-${SAMTOOLS_VERSION} \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd / && rm -rf /SOFT/samtools-${SAMTOOLS_VERSION}

ENTRYPOINT ["/usr/local/bin/samtools"]
CMD ["--help"]


