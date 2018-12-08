FROM heriyanto/rails-blueprint:base

COPY . /myapp
COPY conf/supervisord.conf /etc/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
WORKDIR /myapp

EXPOSE 80 443
