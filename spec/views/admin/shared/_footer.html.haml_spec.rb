require 'rails_helper'

describe 'admin/shared/_footer' do
  before do
    render
  end

  it 'renders the copyright notice' do
    expect(rendered).to match /&copy;\n([0-9]{4})\n/
  end
end