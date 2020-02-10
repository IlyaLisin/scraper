# frozen_string_literal: true

require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'webmock/rspec'

require File.expand_path('../config/environment', __dir__)

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation

  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
