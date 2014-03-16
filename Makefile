jversion:=v21.1.2
j:
	wget https://github.com/downloads/joelthelion/autojump/autojump_$(jversion).tar.gz
	tar xvf autojump_$(jversion).tar.gz
	cd autojump_$(jversion);bash install.sh
	rm -rf autojump_$(jversion)*;
pip:
	apt-get -y install python-setuptools
	easy_install pip
git:
	git config --global user.name "easonlin"
	git config --global user.email "smartsgy@gmail.com"
	git config --global core.editor vim
