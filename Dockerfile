FROM heriyanto/rails-blueprint:migrate
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN rails server
