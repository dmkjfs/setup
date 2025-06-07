echo "Setup is starting..."
sudo apt install curl python3 docker docker-compose git make > /dev/null 2>&1
curl -LsSf https://astral.sh/uv/install.sh | sh > /dev/null 2>&1
source ~/.bashrc
echo "Setup finished!"
