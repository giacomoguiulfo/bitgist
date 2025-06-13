FROM ruby:2.7

# Install dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 14 and Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && npm install -g yarn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Install node modules
COPY package.json yarn.lock ./
RUN yarn install --check-files

# Copy application code
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
