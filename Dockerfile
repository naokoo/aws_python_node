# Dockerfile
FROM python:3.9-alpine

# Set timezone
ENV TZ=Asia/Tokyo

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
    && pip install --upgrade awscli \
    && apk add --no-cache sudo

# Install Japanese locale
RUN apk add --no-cache icu-libs
ENV LANG ja_JP.UTF-8

# Python Library
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --upgrade BeautifulSoup4
RUN pip install --upgrade sklearn
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
