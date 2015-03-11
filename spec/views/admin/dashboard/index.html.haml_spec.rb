require 'rails_helper'

describe 'admin/dashboard/index' do
  it 'renders the page header' do
    render

    expect(rendered).to match /<h1>Dashboard<\/h1>/
  end
end