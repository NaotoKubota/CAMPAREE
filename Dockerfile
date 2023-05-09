###############################################################
# Dockerfile to build container images for CAMPAREE
# Based on python 3.10-buster
################################################################

FROM python:3.10-buster

# File Author / Maintainer
LABEL maintainer="Naoto Kubota <naotok@ucr.edu>"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies first
RUN apt-get -qq update && \
	apt-get -qq -y install git

# Install Java 1.8
RUN apt update && \
	apt install -y apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common && \
	wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
	add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
	apt update && \
	apt install -y adoptopenjdk-8-hotspot


# Install CAMPAREE and BEERS_UTILS
RUN git clone https://github.com/itmat/CAMPAREE.git && \
	git clone https://github.com/itmat/BEERS_UTILS.git && \
	cd CAMPAREE && \
	pip install -r requirements.txt && \
	pip install -r ../BEERS_UTILS/requirements.txt && \
	pip install -e . && \
	pip install -e ../BEERS_UTILS

# Make baby genome
RUN /CAMPAREE/bin/create_star_index_for_baby_genome.sh

# Set working directory
WORKDIR /home

# bash
CMD ["bash"]
