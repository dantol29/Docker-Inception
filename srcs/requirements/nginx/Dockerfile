
# docker run -d -p 8080:8080 -p 443:443 test:123 - to add ports

FROM debian:11

RUN apt-get update && apt-get install -y nginx openssl && apt-get install -y iputils-ping

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem \
-sha256 -days 3650 -nodes -subj \
"/C=DE/ST=Texas/L=Austin/O=42/OU=Org/CN=dtolmaco.42.fr"

COPY  conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /var/www/html

EXPOSE 9000 443

CMD ["nginx", "-g", "daemon off;"]