# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.5'

gem 'activerecord-import'
gem 'async-await'
gem 'faraday'
gem 'grape'
gem 'otr-activerecord'
gem 'pg'
gem 'rack'
gem 'rake'

group :test, :development do
  gem 'pry'
  gem 'pry-nav'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'rack-test'
  gem 'rspec'
  gem 'webmock', '~> 3.0', '>= 3.0.1'
end
