FROM ruby:3.0.3
RUN apt-get update && \
  apt-get install -y libpq-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle -j4
COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
