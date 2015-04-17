require 'rails_helper'

describe 'home/index.html.haml' do
  before do
    render
  end

  describe 'breadcrumbs' do
    it 'displays breadcrumbs at the top of the page' do
      expect(rendered).to match(/Matt Rayner/)
    end
  end

  describe 'header' do
    it 'has the title' do
      expect(rendered).to match(%r{<span class='sr-only'>\n<h1>Matt Rayner</h1})
    end

    it 'has the tagline' do
      expect(rendered).to match(/\n<p class='lead'>Full stack Rubyist in Londo/)
    end

    it 'had a divider' do
      expect(rendered).to match(/class='home-divider'/)
    end
  end
end
