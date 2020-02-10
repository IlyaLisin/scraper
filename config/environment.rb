# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'test'
ENV['PARSE_BATCH_SIZE'] ||= '10'
ENV['DATABASE_URL'] ||= "postgresql://scraper_dev:scraper_dev@localhost:5433/scraper_#{ENV['RACK_ENV']}"

require File.expand_path('application', __dir__)

Bundler.require(:default, ENV['OTR_ENV'] ? ENV['OTR_ENV'].to_sym : :development)
OTR::ActiveRecord.configure_from_file! 'config/database.yml'
