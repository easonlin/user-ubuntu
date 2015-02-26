root:
	sudo openssl genrsa -des3 -out /etc/nginx/rootCA.key  2048
	sudo openssl req -x509 -new -nodes -key /etc/nginx/rootCA.key -days 3650 -out /etc/nginx/rootCA.pem
server:
	sudo openssl genrsa -out server.key 2048
	sudo openssl req -new -key server.key -out server.csr
	sudo openssl x509 -req -in server.csr -CA /etc/nginx/rootCA.pem -CAkey /etc/nginx/rootCA.key -CAcreateserial -out server.crt -days 3650

