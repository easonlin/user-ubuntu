init:
	sudo echo
	wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
	sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
	sudo add-apt-repository "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"
	sudo apt-get update
engine:
	sudo apt-get install -y elasticsearch
	sudo update-rc.d elasticsearch defaults 95 10
	sudo /etc/init.d/elasticsearch start
	netstat -tnulp|grep 9200
python:
	sudo pip install --upgrade pika # For amqp support
	sudo pip install --upgrade git+https://github.com/vklochan/python-logstash.git
java:
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install -y oracle-java7-installer
events:
	sudo apt-get install -y logstash logstash-contrib
	sudo cp -f logstash.conf /etc/logstash/conf.d/logstash.conf
	sudo update-rc.d logstash defaults
	sudo update-rc.d logstash-web defaults
	sudo /etc/init.d/logstash start
	sudo /etc/init.d/logstash-web start
	netstat -tnulp|grep 9292
	echo edit /etc/elasticsearch/elasticsearch.yml http.cors.enabled: true
es2unix:
	mkdir -p ~/bin
	curl -s download.elasticsearch.org/es2unix/es >~/bin/es
	chmod +x ~/bin/es
head:
	sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
	echo 'http://localhost:9200/_plugin/head/'
shell:
	#wget 'http://dl.bintray.com/content/javanna/elasticsearch-tools/release/org/elasticsearch/elasticshell/0.90.0.RC2/elasticshell-0.90.0.RC2.zip?direct' -O /tmp/elasticshell-0.90.0.RC2.zip
	unzip -u /tmp/elasticshell-0.90.0.RC2.zip -d /tmp 
	/tmp/elasticshell-0.90.0.RC2/bin/elasticshell
# Kibana is depreciated by logstash-web
kibana:
	wget https://download.elasticsearch.org/kibana/kibana/${KIBANA_NAME}.tar.gz -O /tmp/kibana-3.1.2.tar.gz
	tar zxvf /tmp/${KIBANA_NAME}.tar.gz -C /tmp
	sudo mkdir -p /usr/share/nginx/html/kibana
	sudo cp -rf /tmp/${KIBANA_NAME}/* /usr/share/nginx/html/kibana
	sudo chown -R www-data:www-data /usr/share/nginx/html/kibana
	sudo cp -f nginx.kibana /etc/nginx/sites-available/kibana
	sudo ln -s /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/kibana;true
	sudo /etc/init.d/nginx restart
