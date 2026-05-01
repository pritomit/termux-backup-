cat > setup_termux.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
pkg update -y && pkg upgrade -y
termux-setup-storage
apt update -y && apt upgrade -y
pkg install -y git php curl wget python python2 python3 pip mpv figlet neofetch cmatrix termux-tools openssh termux-api nodejs vim nano ffmpeg nmap proot-distro rust golang openjdk-17 net-tools dnsutils cowsay toilet
pip install lolcat requests
apt autoremove -y
pkg clean -y
echo "Cleaning completed!"
pkg list-installed
EOF
