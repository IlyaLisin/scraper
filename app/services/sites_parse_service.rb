# frozen_string_literal: true

class SitesParseService
  class << self
    include Async::Await

    async def parse_sites # rubocop:disable Metrics/MethodLength
      batch_size = 10
      requests = ApiRequestsConcurrent.new(batch: ENV['PARSE_BATCH_SIZE'].to_i)

      Site.where(processed: false).each_slice(batch_size) do |batch|
        batch.each do |site|
          requests << SiteApiRequest.new(site)
        end

        responses = requests.perform_all

        data = []

        responses.each do |response|
          next unless response

          data << site_params_from_response(response)
        end

        Site.import(data, on_duplicate_key_update: { columns: %i[title status processed] }, validate: false)
      end
    end

    private

    def site_params_from_response(response)
      {
        id: response[:id],
        url: '',
        title: response[:response].body.scan(%r{<title>(.*?)</title>}).flatten.first,
        status: response[:response].status,
        processed: true
      }
    end
  end
end
