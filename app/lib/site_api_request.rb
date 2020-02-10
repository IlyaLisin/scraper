# frozen_string_literal: true

class SiteApiRequest
  def initialize(site)
    @id = site.id
    uri = site.url.start_with?('http') ? site.url : "https://#{site.url}"
    @uri = uri
  end

  attr_reader :id
  attr_reader :uri
end
