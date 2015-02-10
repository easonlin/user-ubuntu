apache:
	sudo apt-get install apache2 -y
	ifconfig eth0 | grep inet | awk '{print $2}'
mysql:
	sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql -y
	sudo mysql_install_db
	pushd ~;sudo /usr/bin/mysql_secure_installation;popd
php:
	sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt -y
	sudo cp -f info.php /var/www/html/info.php
	echo sudo vim /etc/apache2/mods-enabled/dir.conf
piwik:
	sudo apt-get install php5-curl php5-gd php5-cli php5-geoip 'freetype*' -y
	wget http://builds.piwik.org/piwik.zip -O /tmp/piwik.zip
	sudo unzip -u /tmp/piwik.zip -d /var/www/html/
	sudo mkdir -p /var/www/html/piwik/tmp
	sudo chown -R www-data:www-data /var/www/html/piwik
	sudo chmod -R 0755 /var/www/html/piwik/tmp
	mysql -u root -p < create_db.sql 
