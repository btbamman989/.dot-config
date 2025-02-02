DOT_CONFIG_DIR=~/.dot-config

make lint:
	shellcheck -s sh \.shell/**/*.sh

antigen:
	curl -L git.io/antigen > ${DOT_CONFIG_DIR}/antigen.zsh

install:
	$(MAKE) antigen

	ln -si ${DOT_CONFIG_DIR}/.tmux/ ~/.tmux
	ln -si ~/.tmux/.tmux.conf ~/.tmux.conf
	ln -si ${DOT_CONFIG_DIR}/.vim/ ~/.vim
	ln -si ${DOT_CONFIG_DIR}/.fonts/ ~/.fonts
	ln -si ${DOT_CONFIG_DIR}/.gitconfig ~/.gitconfig
	ln -si ${DOT_CONFIG_DIR}/.gitignore_global ~/.gitignore_global
	ln -si ${DOT_CONFIG_DIR}/.zshrc ~/.zshrc
	ln -si ${DOT_CONFIG_DIR}/.vcspull ~/.vcspull
	ln -si ${DOT_CONFIG_DIR}/.vcspull.yaml ~/.vcspull.yaml
	ln -si ${DOT_CONFIG_DIR}/.Xresources ~/.Xresources
	ln -si ${DOT_CONFIG_DIR}/.ipython ~/.ipython
	ln -si ${DOT_CONFIG_DIR}/.ptpython ~/.ptpython

debian_fix_inotify:
	# Fixes inotify for watchman
	echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

debian_packages:
	sudo apt-get install \
	tmux \
	cmake ninja-build \
	rxvt-unicode-256color \
	cowsay \
	fortune-mod \
	vim-nox \
	ctags \
	silversearcher-ag \
	wget \
	git \
	tig \
	keychain \
	most \
	entr \
	curl \
	openssh-server \
	pgadmin3 \
	postgresql-11 \
	htop \
	redis-server \
	fonts-noto-cjk xfonts-wqy \
	libpython3.7-dev python3-pip libpython-dev \
	libsasl2-dev libxslt1-dev libxmlsec1-dev libxml2-dev libldap2-dev \
	build-essential \
	pkg-config libtool m4 automake autoconf \
	kitty

pip_packages:
	pip install --user -U \
	python-language-server \
	virtualenv \
	pip \
	pipenv \
	tmuxp \
	vcspull \
	dotfiles \
	spotdl
