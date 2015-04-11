require 'rails_helper'

describe 'home/index.html.haml' do
  before do
    render
  end

  it 'Displays a coming soon title' do
    expect(rendered).to match(%r{<h1>Coming Soon!<\/h1>})
  end

  it 'Displays the coming soon text' do
    expect(rendered).to match(/<p>Thanks for your interest! I'm busy/)
  end
end
