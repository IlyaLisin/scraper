# frozen_string_literal: true

require 'spec_helper'

describe ApiRequestsConcurrent do
  include Rack::Test::Methods

  let(:request) do
    OpenStruct.new(id: '1', uri: 'https://example.com')
  end

  let(:result) do
    service = described_class.new
    service << request
    service.perform_all
  end

  before do
    stub_request(:get, 'https://example.com/')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v1.0.0'
        }
      )
      .to_return(status: 200, body: 'test response', headers: {})

    result
  end

  it 'returns results' do
    expect(result).not_to be_nil
  end

  it 'returns response with id' do
    expect(result.first[:id]).to eq('1')
  end

  it 'returns response with body' do
    expect(result.first[:response].body).to eq('test response')
  end
end
