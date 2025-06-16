#!/bin/bash

# Tạo user nếu cần
useradd -m coder
echo 'coder:1234' | chpasswd

# Thiết lập VNC
mkdir -p /home/coder/.vnc
echo "1234" | vncpasswd -f > /home/coder/.vnc/passwd
chmod 600 /home/coder/.vnc/passwd
chown -R coder:coder /home/coder/.vnc

# Tạo script khởi động VNC
cat <<EOF > /home/coder/.vnc/xstartup
#!/bin/sh
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x /home/coder/.vnc/xstartup

# Khởi động VNC khi container bật
cat <<EOF >> /etc/profile
vncserver :1 -geometry 1280x720 -depth 24
EOF

echo "✅ Setup complete. Dùng VNC Viewer với địa chỉ localhost:5901, pass: 1234"
