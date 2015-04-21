require 'rails_helper'

describe 'case_studies/index.html.haml' do
  before do
    render
  end

  it 'renders the page title' do
    expect(rendered).to match(%r{<h1>Case Studies</h1>})
  end
end
