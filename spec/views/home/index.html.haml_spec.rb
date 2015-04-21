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
    it 'renders the title' do
      expect(rendered).to match(%r{<span class='sr-only'>\n<h1>Matt Rayner</h1})
    end

    it 'renders the tagline' do
      expect(rendered).to match(/\n<p class='lead'>Full stack Rubyist in Londo/)
    end

    it 'had a divider' do
      expect(rendered).to match(/class='home-divider'/)
    end
  end

  describe 'first content block' do
    it 'renders the lead text' do
      expect(rendered).to match(/I design and develop beautiful things for pri/)
    end

    it 'renders the content text' do
      expect(rendered).to match(/I design and develop beautiful things for pri/)
    end
  end

  describe 'case studies block' do
    it 'renders the title text' do
      expect(rendered).to match(/I Live and Breathe Digital Online/)
    end

    it 'renders the lead text' do
      expect(rendered).to match(/Everything from SaaS cloud applications to e-/)
    end

    it 'renders the content text' do
      expect(rendered).to match(/I’ve made them, often for challenging clients/)
    end

    it 'renders the view case studies button' do
      expect(rendered).to match(%r{cta" href="http://test.host/case_studies">V})
    end
  end

  describe 'skills block' do
    it 'renders the title text' do
      expect(rendered).to match(/I've Got a Wide Set of Skills/)
    end

    it 'renders the lead text' do
      expect(rendered).to match(/Everything from server management to jQuery, /)
    end

    it 'renders the content text' do
      expect(rendered).to match(/I'm a perfect fit for your large or small tea/)
    end

    it 'renders the view case studies button' do
      expect(rendered).to match(%r{cta" href="http://test.host/skills">View Sk})
    end
  end
end
