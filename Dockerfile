# Dockerfile
FROM python:3.9-alpine

# Set timezone
ENV TZ=Asia/Tokyo

# Install sudo
RUN apk add --no-cache sudo

# Install necessary packages
RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    curl \
    unzip \
    groff \
    less \
    py-pip \
    jq \
    bash \
    musl-dev gcc g++ make \
    && pip install --upgrade awscli

# Install Japanese locale
RUN apk add --no-cache icu-libs icu-dev
ENV LANG ja_JP.UTF-8

# Install Fortran for scikit-learn
# RUN apk add --no-cache gfortran

# Python Library
RUN pip install --upgrade pip
#RUN pip install numpy
# Install numpy
RUN pip install --no-cache-dir numpy

# RUN pip install scipy
RUN pip install cython
RUN pip install setuptools
RUN pip install wheel
RUN pip install --upgrade BeautifulSoup4

# Install OpenBLAS
#RUN apk add --no-cache openblas-dev

# Install scikit-learn
#RUN pip install --upgrade scikit-learn

#RUN sudo apk add py3-scikit-learn
RUN apk update && apk add py3-scikit-learn

RUN pip install --upgrade tqdm

# Create a non-root user
RUN adduser -D myuser
RUN addgroup myuser wheel
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER myuser

WORKDIR /home/myuser

# Expose volume for AWS credentials
VOLUME ["/home/myuser/.aws"]

CMD ["/bin/bash"]
