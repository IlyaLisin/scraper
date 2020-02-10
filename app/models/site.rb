# frozen_string_literal: true

class Site < ActiveRecord::Base
  validates :url, presence: true

  def self.create_by_urls(urls)
    return unless urls.is_a?(Array)

    params = urls.map { |u| { url: u } }
    import(params, on_duplicate_key_ignore: true, validate: true)
  end
end
