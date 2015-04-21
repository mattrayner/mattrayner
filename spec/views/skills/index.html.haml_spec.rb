require 'rails_helper'

describe 'skills/index.html.haml' do
  before do
    render
  end

  it 'renders the page title' do
    expect(rendered).to match(%r{<h1>Skills</h1>})
  end
end
