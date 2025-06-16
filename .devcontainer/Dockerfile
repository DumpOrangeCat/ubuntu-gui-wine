FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  xfce4 xfce4-goodies tightvncserver wget nano curl git \
  firefox xterm wine64 \
  && apt clean

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
