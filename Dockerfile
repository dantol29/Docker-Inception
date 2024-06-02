
# docker run -d -p 8080:8080 -p 443:443 test:123 - to add ports

FROM debian:11

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem \
-sha256 -days 3650 -nodes -subj \
"/C=DE/ST=Texas/L=Austin/O=42/OU=Org/CN=dtolmaco.42.fr"

RUN echo ' \
events { } \
http { \
    server { \
        listen 443 ssl; \
        ssl_protocols TLSv1.2 TLSv1.3; \
        ssl_certificate /etc/nginx/cert.pem; \
        ssl_certificate_key /etc/nginx/key.pem; \
        location / { \
            root /app; \
            index index.html; \
        } \
    } \
}' > /etc/nginx/nginx.conf

WORKDIR /app

EXPOSE 9000 443

CMD ["nginx", "-g", "daemon off;"]