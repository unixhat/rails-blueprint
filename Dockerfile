FROM heriyanto/rails-blueprint:base
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN rails server
