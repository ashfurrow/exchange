source 'https://rubygems.org'

ruby File.read('.ruby-version')

gem 'rails', '5.2.1'

gem 'pg'
gem 'puma'

gem 'activeadmin'
gem 'artsy-auth'
gem 'artsy-eventservice'
gem 'carmen'
gem 'dalli'
gem 'ddtrace', '>= 0.15.0' # datadog instrumentation
gem 'dogstatsd-ruby', require: 'datadog/statsd' # send metrics to datadog agent
gem 'faraday'
gem 'graphql'
gem 'jwt'
gem 'micromachine'
gem 'money' # Library for dealing with money and currency conversion
gem 'paper_trail'
gem 'sentry-raven'
gem 'sidekiq'
gem 'stripe'
gem 'taxjar-ruby', require: 'taxjar'

group :development, :test do
  gem 'byebug'
  gem 'graphlient'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'coveralls', require: false
  gem 'danger'
  gem 'fabrication'
  gem 'stripe-ruby-mock', '~> 2.5.4', require: 'stripe_mock'
  gem 'timecop'
  gem 'webmock'
end
