#                                        Ü       ÜÜÜÜÜÜÜÜÜÜÜ
#       Ü ÜÜÜÜÜÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜ °    ÜÛ² Ü ÜÜÜÛÛÛßßßßßßÛÛÛÛÜ  °
#            ßßßßßßÛÛÛ² Ü   ßÛÛÛ² ±   ÛÛÛ²     ÛÛÛ² °     ÛÛÛ²  ±
#                  ÛÛÛ² °    ÛÛÛ² ß   ÛÛÛ²     ÛÛÛ² ß     ÛÛÛ²  ²
#           ÜÜÜÜÜÜÜÛÛÛ²ÜÜÜÜÜÜÛÛÛ² ÜÜÛÛÛÛÛÛÛÛÛÜÜßßÛ²ÜÛÛÛÛÛÛÛÛÛ²  ß
#          ÛÛÛßßßßßÛÛÛ²ßßßßßßÛÛÛ²ßßßßßÛÛÛ²ßßßßßßßÜ² Ü     ÛÛÛ²  Ü
#           ßÜ     ÛÛÛ² Ü    ÛÛÛ² Ü   ÛÛÛ² Ü   ÛÛÛ² ²     ÛÛÛ²  ²
#                  ÛÛÛ² ²    ÛÛÛ² ²   ÛÛÛ² ²   ÛÛÛ² ±     ÛÛÛ²  ±
#                  ÛÛÛ² ±    ÛÛÛ² ±   ÛÛÛ² ±   ÛÛÛ² °     ÛÛÛ²  °
#                  ÛÛÛ² °    ÛÛÛ² °   ÛÛÛ² °   ÛÛÛ²  Ü    ÛÛÛ²   Ü
#                 ÜÛÛÛÛÜÜß  ÜÛÛÛÛÜÜÜß  ÛÛ²  ÜÜÛÛÛÛÛÛß   ÜÛÛÛÛÛÛßß
#              Üßßßßßßßß  Üßßßßßßß      ßÛ ß           ß     [BROAD‘17]
#         Ü ÜÜÜ ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ ÜÜÜ Ü
#
#                  ... Broad Institute of MIT and Harvard ‘17
#
#                               Proudly Present ...
#
#        ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
#     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
#     ³                                                                  ³
#     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
#        ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
#                        Released at [þþ:þþ] on [þþ/þþ/þþ]
#     ÉÍÍÍÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Ä  ÄÄ  Ä  Ä   ú   Ä  Ä  ÄÄ  Ä ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÍÍÍ»
#     ³                                                                  º
#     ³   [Supplier    : 0x00B1........] [Operating System : all.....]   ³
#     ³   [Packager    : 0x00B1........] [Video            : none....]   ³
#     ³   [Cracker     : none..........] [Audio            : none....]   ³
#     ³   [Protection  : none..........] [Number of Disks  : 1.......]   ³
#     ú   [Type        : Dockerfile....] [Rating           : ........]   ú
#     ú                                                                  ú    
#     ú                                                                  ú
#     ú   Well, this is a little Dockerfile that have many functions     ú
#     ú   for quantifying phenotypes...enjoy....                         ú
#     ú                                                                  ú
#     ú                                                                  ú
#     ³                                                                  ³
#     ³                                                                  ³
#     ³                                                                  ³
#     ³                                                                  ³
#     º                                                                  º
#     ÈÍÍÍÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Ä  ÄÄ  Ä  Ä   ú   Ä  Ä  ÄÄ  Ä ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÍÍÍ¼
#
#     Greets: ...
#
#         mcquin
#         purohit
#
#                                 - [ BROAD‘17 ] -
#                                                          -0x00B1 [05/06/84]
FROM ubuntu:16.04

# Install prerequisites (adapted from https://hub.docker.com/r/continuumio/miniconda/~/dockerfile/)
RUN apt-get update && apt-get install -y \
  build-essential \
  bzip2 \
  ca-certificates \
  curl \
  default-jdk \
  git \
  libglib2.0-0 \
  libhdf5-dev \
  libmysqlclient-dev \
  libsm6 \
  libxext6 \
  libxml2-dev \
  libxrender 1\
  libxslt1-dev

RUN curl -L "https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh" > miniconda.sh

RUN /bin/bash miniconda.sh -b -p /miniconda
RUN rm miniconda.sh
ENV PATH="/miniconda/bin:$PATH"
RUN conda update -y conda \
  && conda config --set always_yes True

# Configure conda environment for CellProfiler
RUN conda install -y \
  cython \
  h5py \
  ipywidgets \
  javabridge \
  libtiff \
  libxml2 \
  libxslt \
  lxml \
  packaging \
  pillow \
  pip \
  pyzmq \
  matplotlib \
  mysql-python \
  numpy \
  requests \
  scikit-image \
  scikit-learn \
  scipy

RUN conda install -y -c https://conda.anaconda.org/bioconda/linux-64 \
  java-jdk

RUN conda install -y -c https://conda.anaconda.org/conda-forge/linux-64 \
  appdirs \
  jupyter \
  mahotas \
  raven \
  sphinx \
  tifffile

RUN conda install -y -c https://conda.anaconda.org/bjornfjohansson/linux-64 \
  wxpython=3.0.2.0

RUN /miniconda/bin/pip install cellh5
RUN /miniconda/bin/pip install centrosome
RUN /miniconda/bin/pip install inflect
RUN /miniconda/bin/pip install prokaryote
RUN /miniconda/bin/pip install python-bioformats

# Install CellProfiler
WORKDIR /usr/local/src
RUN git clone https://github.com/CellProfiler/CellProfiler.git
WORKDIR /usr/local/src/CellProfiler
ARG VERSION=tags/v3.0.0
RUN git checkout $VERSION
RUN /miniconda/bin/pip install --editable .

# Fix init and zombie process reaping problems using s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /

ENTRYPOINT ["/init", "cellprofiler"]

CMD ["--run", "--run-headless", "--help"]
