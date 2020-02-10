# frozen_string_literal: true

module App
  module Api
    class Sites < Grape::API
      version 'v1'
      format :json
      prefix :api

      resource 'sites' do
        params do
          requires :urls, type: Array[String]
        end

        post '/' do
          Site.create_by_urls(params[:urls])
          SitesParseService.parse_sites
          status 201
        end
      end
    end
  end
end
