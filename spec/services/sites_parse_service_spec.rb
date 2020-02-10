# frozen_string_literal: true

require 'spec_helper'

describe SitesParseService do
  include Rack::Test::Methods

  let(:site) { Site.create!(url: 'example.com', processed: false) }

  before do
    site

    stub_request(:get, 'https://example.com/')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v1.0.0'
        }
      )
      .to_return(status: 200, body: '<title>Example</title>', headers: {})

    described_class.parse_sites
  end

  it 'update processed flag' do
    expect(site.reload.processed).to eq(true)
  end

  it 'update title' do
    expect(site.reload.title).to eq('Example')
  end

  it 'update status' do
    expect(site.reload.status).to eq(200)
  end

  it 'does not update url' do
    expect(site.reload.url).to eq('example.com')
  end

  context 'with parsed sites' do
    let(:site) { Site.create!(url: 'example.com', processed: true) }

    it 'does not update processed flag' do
      expect(site.reload.processed).to eq(true)
    end

    it 'does not update status' do
      expect(site.reload.status).to eq(nil)
    end
  end
end
