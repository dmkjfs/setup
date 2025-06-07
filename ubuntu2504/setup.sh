echo "Setup is starting..."
cd

echo "Base configuration..."
sudo apt install curl wget flatpak > /dev/null 2>&1
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo > /dev/null 2>&1

echo "Installing GPU drivers..."
sudo ubuntu-drivers install --gpgpu > /dev/null 2>&1

echo "Setting file structure..."
mkdir Sandbox scripts projects > /dev/null 2>&1

echo "Installing development toolkit..."
sudo apt install \
    git \
    make \
    docker \
    docker-compose \
    python3 > /dev/null 2>&1
sudo apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev > /dev/null 2>&1
curl -LsSf https://astral.sh/uv/install.sh | sh > /dev/null 2>&1
curl -fsSL https://pyenv.run | bash > /dev/null 2>&1
curl -sSL https://install.python-poetry.org | python3 - > /dev/null 2>&1
flatpak install flathub \
    com.jetbrains.PyCharm-Community \
    com.jgraph.drawio.desktop > /dev/null 2>&1


echo "Configuring development toolkit..."
echo 'export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
export PATH="/$HOME/.local/bin:$PATH"' >> .bashrc > /dev/null 2>&1
echo 'export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"' >> .bash_profile > /dev/null 2>&1
git config --global user.name $name > /dev/null 2>&1
git config --global user.email $email > /dev/null 2>&1
git config --global pull.rebase false > /dev/null 2>&1
git config --global core.autocrlf input > /dev/null 2>&1
ssh-keygen -o -t rsa -C $email


echo "Installing apps..."
sudo apt purge firefox > /dev/null 2>&1
sudo rm -Rf /usr/bin/firefox /usr/loca/firefox > /dev/null 2>&1
sudo snap remove firefox > /dev/null 2>&1
sudo apt install gnome-shell-extensions gnome-tweaks
flatpak install flathub \
    app.zen_browser.zen \
    org.gnome.Calendar \
    org.gnome.Cheese \
    org.gnome.Contacts \
    org.gnome.Characters \
    org.gnome.Weather \
    org.gnome.SoundRecorder \
    org.gnome.Calculator
    org.gnome.Music \
    com.spotify.Client \
    org.telegram.desktop \
    com.discordapp.Discord \
    org.signal.Signal \
    com.getpostman.Postman \
    io.beekeeperstudio.Studio \
    md.obsidian.Obsidian \
    com.dropbox.Client \
    com.obsproject.Studio \
    org.mozilla.Thunderbird \
    org.libreoffice.LibreOffice \
    org.getoutline.OutlineClient \
    org.getoutline.OutlineManager \
    org.gnome.Totem \
    org.videolan.VLC \
    org.keepassxc.KeePassXC > /dev/null 2>&1

echo "Configuring GTK theme..."
git clone https://github.com/vinceliuice/Jasper-gtk-theme > /dev/null 2>&1
git clone https://github.com/vinceliuice/Colloid-icon-theme.git > /dev/null 2>&1

./Jasper-gtk-theme/install.sh -l > /dev/null 2>&1
./Colloid-icon-theme/install.sh -t teal > /dev/null 2>&1
sudo rm -rf Jasper-gtk-theme Colloid-icon-theme > /dev/null 2>&1

echo "Cleaning auxiliary dependencies..."
sudo apt autoremove > /dev/null 2>&1

echo "Setup finished successfully! Your device will restart now."
sleep 5
source ~/.bashrc > /dev/null 2>&1
sudo reboot > /dev/null 2>&1
