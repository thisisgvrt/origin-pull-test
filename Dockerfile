from nginx:latest
ADD https://developers.cloudflare.com/ssl/static/authenticated_origin_pull_ca.pem /etc/nginx/certs/cloudflare.crt
RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 30 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=ravi.zone" -addext "subjectAltName=DNS:example.com,IP:127.0.0.1"
COPY ./default.conf /etc/nginx/conf.d/default.conf