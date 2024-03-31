
DOMAIN=leap.ai
CERTPATH=/etc/ssl/certs
PRIVATEPATH=/etc/ssl/private


build:
	@docker build -t nginx-tls-proxy .

run:
	@docker run -d \
	-p 443:443 \
	-v ${CERTPATH}:/etc/ssl/certs \
	-v ${PRIVATEPATH}:/etc/ssl/private \
	-e DOMAIN=your_domain.com \
	-e PORT=80 \
	--name nginx-tls-proxy nginx-tls-proxy
