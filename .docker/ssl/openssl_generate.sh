openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout docker.key \
		-out docker.crt \
		-subj "/CN=localhost" \
		-addext "subjectAltName=DNS:localhost"

chmod 644 docker.crt

chmod 600 docker.key