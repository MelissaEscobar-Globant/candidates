# Dockerfile
FROM ruby:3.0.6 AS rails-toolbox

# Default directory
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . /app/
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
