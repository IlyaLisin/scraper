# frozen_string_literal: true

require 'spec_helper'

describe SiteApiRequest do
  include Rack::Test::Methods

  context 'valid params without http' do
    let(:site) { Site.create!(url: 'example.com') }

    before do
      described_class.new(site)
    end

    it 'initializeds with normalized uri' do
      site_api_request = described_class.new(site)

      expect(site_api_request.uri).to eq('https://example.com')
    end

    it 'initializeds with id' do
      site_api_request = described_class.new(site)

      expect(site_api_request.id).to eq(site.id)
    end
  end

  context 'valid params with https' do
    let(:site) { Site.create!(url: 'https://example.com') }

    before do
      described_class.new(site)
    end

    it 'initializeds with normalized uri' do
      site_api_request = described_class.new(site)

      expect(site_api_request.uri).to eq('https://example.com')
    end

    it 'initializeds with id' do
      site_api_request = described_class.new(site)

      expect(site_api_request.id).to eq(site.id)
    end
  end
end
