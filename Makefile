jversion:=v21.1.2
j:
	wget https://github.com/downloads/joelthelion/autojump/autojump_$(jversion).tar.gz
	tar xvf autojump_$(jversion).tar.gz
	cd autojump_$(jversion);bash install.sh
	rm -rf autojump_$(jversion)*;
pip:
	apt-get install python-setuptools -y
	easy_install pip
