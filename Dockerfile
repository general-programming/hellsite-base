FROM ubuntu:19.10

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install nginx php-fpm git && \
    rm -rf /etc/nginx/sites-enabled/*

COPY default.conf /etc/nginx/sites-enabled/default

EXPOSE 80
STOPSIGNAL SIGTERM
WORKDIR /app

COPY ../ .

CMD ["nginx", "-g", "daemon off;"]
