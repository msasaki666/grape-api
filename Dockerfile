FROM node:17.2.0 as node

FROM ruby:3.0.3
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /opt/yarn-* /opt/yarn
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn && \
  apt-get update && \
  apt-get install -y libpq-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle -j4
COPY package.json yarn.lock ./
RUN yarn
COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
