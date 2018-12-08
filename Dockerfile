FROM heriyanto/rails-blueprint:base

ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/conf.d /etc/nginx/conf.d
RUN mkdir -p /var/cache/nginx/sleekr/webcache

COPY . /myapp
COPY conf/supervisord.conf /etc/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
WORKDIR /myapp

EXPOSE 80 443
