require 'rails_helper'

describe 'home/index.html.haml' do
  before do
    render
  end

  it 'Displays a coming soon title' do
    expect(rendered).to match /<h1>Coming Soon!<\/h1>/
  end

  it 'Displays the coming soon text' do
    expect(rendered).to match /<p>Thanks for your interest! I'm busy beavering away behind the scenes to get my new site up and running. Until then, you can catch me on GitHub.<\/p>/
  end
end