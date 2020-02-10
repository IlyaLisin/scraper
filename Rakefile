# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'rake'

load 'tasks/otr-activerecord.rake'

OTR::ActiveRecord.db_dir = 'db'
OTR::ActiveRecord.migrations_paths = ['db/migrate']

namespace :db do
  task :environment do
    require_relative 'config/environment'
  end
end

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('config/environment', __dir__)
end

task routes: :environment do
  Api::Sites.routes.each do |route|
    method = route.request_method.ljust(10)
    path = route.origin
    puts "     #{method} #{path}"
  end
end
