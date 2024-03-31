
DOMAIN=leap.ai
PORT=80
CERTPATH=./ssl/certs/
PRIVATEPATH=./ssl/private/


build:
	@docker build -t nginx-tls-proxy .

# run:
# 	@docker run -d \
# 	-p 443:443 \
# 	-v ${CERTPATH}:/etc/ssl/certs \
# 	-v ${PRIVATEPATH}:/etc/ssl/private \
# 	-v ./logs:/var/log/nxlog \
# 	-e DOMAIN=${DOMAIN} \
# 	-e PORT=${PORT} \
# 	--name nginx-tls-proxy nginx-tls-proxy

run: 
	@docker run --name nginx-ssl \
	-v ./conf:/etc/nginx/conf.d/ \
	-v ./ssl:/etc/nginx/ssl/ \
	-p 443:443 \
	--network k3d-tensorleap \
	-d nginx