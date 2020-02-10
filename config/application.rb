# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

Dir[File.expand_path('../app/api/*.rb', __dir__)].sort.each do |f|
  require f
end

Dir[File.expand_path('../app/models/*.rb', __dir__)].sort.each do |f|
  require f
end

Dir[File.expand_path('../app/lib/*.rb', __dir__)].sort.each do |f|
  require f
end

Dir[File.expand_path('../app/services/*.rb', __dir__)].sort.each do |f|
  require f
end
