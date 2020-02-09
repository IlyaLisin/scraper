require "spec_helper"

RSpec.describe Scrapper::Views::ApplicationLayout, type: :view do
  let(:layout)   { Scrapper::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    expect(rendered).to include('Scrapper')
  end
end
