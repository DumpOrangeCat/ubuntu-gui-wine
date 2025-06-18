# .devcontainer/Dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:1 \
    VNC_PORT=5901 \
    NOVNC_PORT=6080

RUN dpkg --add-architecture i386 && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt update && apt install -y \
    xfce4 xfce4-goodies tightvncserver \
    wine64 wine32:i386 winbind winetricks \
    libgl1-mesa-dri libglu1-mesa mesa-utils \
    ttf-mscorefonts-installer fonts-wine pulseaudio \
    wget git python3-pip websockify && \
    git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/*

RUN useradd -m -s /bin/bash vscode && \
    echo "vscode:vscode" | chpasswd && \
    chown -R vscode:vscode /opt/novnc

USER vscode
WORKDIR /home/vscode

RUN mkdir -p ~/.vnc && \
    echo "#!/bin/sh\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\nexport DISPLAY=:1\nexec startxfce4" > ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup && \
    echo "vscode\nvscode\nn" | vncserver :1 && vncserver -kill :1

COPY --chown=vscode entrypoint.sh /home/vscode/
RUN chmod +x /home/vscode/entrypoint.sh

EXPOSE 5901 6080
CMD ["./entrypoint.sh"]FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  xfce4 xfce4-goodies tightvncserver wget nano curl git \
  firefox xterm wine64 \
  && apt clean

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
