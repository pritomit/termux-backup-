cat > PritomX.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

echo "=========================================="
echo "     PritomX - Complete Termux Setup"
echo "=========================================="

# প্রথম অংশ: বেসিক টার্মিনাল সেটআপ
echo ""
echo "[PART 1] Basic Termux Setup"
echo "----------------------------------------"

echo "--> Updating packages..."
pkg update -y && pkg upgrade -y

echo "--> Setting up storage access..."
termux-setup-storage

echo "--> Updating apt packages..."
apt update -y && apt upgrade -y

echo "--> Installing basic tools..."
pkg install -y git php curl wget python python2 python3 pip mpv figlet neofetch cmatrix termux-tools openssh termux-api nodejs vim nano ffmpeg nmap proot-distro rust golang openjdk-17 net-tools dnsutils cowsay toilet

echo "--> Installing python packages..."
pip install lolcat requests

echo "--> Cleaning up..."
apt autoremove -y
pkg clean -y
echo "Cleaning completed!"

echo ""
echo "[PART 2] Additional Tools (cloudflared, Tool-X, cupp)"
echo "----------------------------------------"

echo "--> Installing additional dependencies..."
pkg install -y golang git debianutils make python python2 python3

echo "--> Downloading and installing cloudflared..."
git clone https://github.com/cloudflare/cloudflared.git --depth=1
cd cloudflared
sed -i 's/linux/android/g' Makefile
make cloudflared
install cloudflared /data/data/com.termux/files/usr/bin
cd ..
echo "cloudflared installed successfully!"

echo "--> Downloading and installing Tool-X..."
git clone https://github.com/ekadanuarta/Tool-X.git
cd Tool-X
chmod +x install
echo "y" | sh install
cd ..
echo "Tool-X installed successfully!"

echo "--> Downloading and installing cupp..."
git clone https://github.com/Mebus/cupp.git
cd cupp
python3 cupp.py --help
cd ..
echo "cupp installed successfully!"

echo ""
echo "=========================================="
echo "     Installation Complete!"
echo "=========================================="
echo "YouTube: https://youtube.com/c/rajbhx"
echo ""
echo "Installed packages list:"
pkg list-installed
echo ""
echo "You can now use:"
echo "  - cloudflared"
echo "  - Tool-X (cd Tool-X && sh install)"
echo "  - cupp (cd cupp && python3 cupp.py)"
echo "=========================================="
EOF
