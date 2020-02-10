# frozen_string_literal: true

require 'spec_helper'

describe Site, type: :model do
  context 'create_by_urls with valid params' do
    let(:valid_params) { ['example.com', 'example2.com'] }

    it 'creates site' do
      expect { described_class.create_by_urls(valid_params) }.to change(described_class, :count).by(2)
    end
  end

  context 'create_by_urls with invalid params' do
    let(:invalid_params) { 'example.com' }

    it 'does not create site' do
      expect { described_class.create_by_urls(invalid_params) }.to change(described_class, :count).by(0)
    end
  end
end
