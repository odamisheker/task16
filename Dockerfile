FROM nginx:1.22

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y nginx-extras procps
      
RUN  mkdir -p /etc/letsencrypt
COPY ./lets/letsencrypt /etc/letsencrypt

COPY ./nginx.conf /etc/nginx
COPY ./html /usr/local/nginx/html
WORKDIR /usr/local/nginx/html

WORKDIR /app

RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d /var/lib/
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid &&\
        chown -R nginx:nginx /usr/local/nginx/html && chmod -R 755 /usr/local/nginx/html

USER nginx
EXPOSE 443
ENTRYPOINT ["/bin/sh", "-c", "nohup /usr/local/nginx/html/cpuinfo.sh & exec nginx -g 'daemon off;'"]