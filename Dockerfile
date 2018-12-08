FROM heriyanto/rails-blueprint:base
WORKDIR /myapp
COPY . /myapp
RUN rails server
