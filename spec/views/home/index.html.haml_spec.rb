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
end
