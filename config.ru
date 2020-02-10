# frozen_string_literal: true

require File.expand_path('config/environment', __dir__)

use OTR::ActiveRecord::ConnectionManagement

run App::Api::Sites
