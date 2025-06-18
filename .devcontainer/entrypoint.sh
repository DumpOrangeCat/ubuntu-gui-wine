#!/bin/bash
# .devcontainer/entrypoint.sh

# Start VNC server
vncserver :1 -geometry 1280x720 -depth 24 -localhost no &

# Start noVNC
/usr/bin/websockify --web=/opt/novnc $NOVNC_PORT localhost:$VNC_PORT &

# Keep container alive
tail -f /dev/null
