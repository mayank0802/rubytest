#dockerfile rails and nginx
FROM ruby:2.4
FROM nginx

RUN apt-get update -qq && apt-get -y install apache2-utils

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/src/app
#COPY Gemfile* ./
#RUN bundle install
COPY . .

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ] 
