FROM ruby:3.1.0
# Install node 14-LTS and yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn@1
WORKDIR /blogstrap
COPY Gemfile /blogstrap/Gemfile
COPY Gemfile.lock /blogstrap/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# RUN SECRET_KEY_BASE=1 RAILS_ENV=production bundle exec rake assets:precompile
CMD ["bundle", "exec"]
#, "puma", "-C", "config/puma.rb"]