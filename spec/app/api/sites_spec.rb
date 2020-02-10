# frozen_string_literal: true

require 'spec_helper'

describe App::Api::Sites do
  include Rack::Test::Methods

  def app
    App::Api::Sites
  end

  describe 'POST #sites' do
    context 'valid params' do
      before do
        stub_request(:get, 'https://example.com/')
          .with(
            headers: {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent' => 'Faraday v1.0.0'
            }
          )
          .to_return(status: 200, body: '', headers: {})
      end

      let(:default_request) do
        post '/api/v1/sites', urls: ['example.com']
      end

      it 'create site record' do
        expect { default_request }.to change(Site, :count).by(1)
      end

      it 'respond with 201' do
        default_request

        expect(last_response.status).to eq(201)
      end
    end

    context 'invalid params' do
      let(:default_request) do
        post '/api/v1/sites'
      end

      it 'does not create site' do
        expect { default_request }.to change(Site, :count).by(0)
      end

      it 'respond with 400' do
        default_request

        expect(last_response.status).to eq(400)
      end
    end
  end
end
