FROM debian:11

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem \
-sha256 -days 3650 -nodes -subj \
"/C=DE/ST=Texas/L=Austin/0=42/OU=Org/CN=dtolmaco.42.fr"

WORKDIR /app


# EXPOSE port

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]