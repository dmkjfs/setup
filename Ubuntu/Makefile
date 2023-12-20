NAME = "Ilya Kuznetsov"
EMAIL = "ilya.kuznetsoff@proton.me"

make install-git:
	sudo apt install git

make configure-git:
	git config --global core.autocrlf input
	git config --global user.name $(NAME)
	git config --global user.email $(EMAIL)

	ssh-keygen -o -t rsa -C $(EMAIL)

	cd .ssh
	>> config
	>> known_hosts

	echo "# Personal Github\nHost github.com\nUser $(EMAIL)\nIdentityFile ~/.ssh/id_rsa" >> config
	echo ssh-keyscan -t rsa github.com >> known_hosts

	cd ..

install-chrome:
	sudo add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" && \
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sudo apt-get update && \
	sudo apt-get install google-chrome-stable

install-poetry:
	sudo apt install curl
	curl -sSL https://install.python-poetry.org | python3 -
	echo 'export PATH="/home/ilya/.local/bin:$PATH"' >> ~/.bashrc
	poetry --version

install-pyenv:
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
	echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
	echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
	exec "$SHELL"

install-python:
	pyenv install 3.11.3
	pyenv install 3.11.4
	pyenv install 3.10.4
	pyenv install 3.10.6
	pyenv install 3.9.5
	pyenv global 3.11.4

install-telegram:
	snap install telegram

install-discord:
	snap install discord

install-signal:
	wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
	cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
	  sudo tee /etc/apt/sources.list.d/signal-xenial.list

	sudo apt install signal-desktop

install-zoom:
	wget https://zoom.us/client/5.17.0.1682/zoom_amd64.deb
	sudo apt install ./zoom_amd64.deb

install-obsidian:
	wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/obsidian_1.4.16_amd64.deb
	sudo apt install obsidian_1.4.16_amd64.deb

install-typora:
	wget -qO - https://typoraio.cn/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
	sudo add-apt-repository 'deb https://typora.io/linux ./'
	sudo apt-get install typora

install-gimp:
	snap install gimp

install-obs:
	sudo add-apt-repository ppa:obsproject/obs-studio
	sudo apt install obs-studio

install-vscode:
	snap install code

install-pycharm:
	snap install pycharm-community

install-docker:
	sudo apt install docker-compose	&& \
	sudo usermod -aG docker $$USER && \
	sudo service docker restart
