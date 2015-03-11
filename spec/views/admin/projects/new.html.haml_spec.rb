require 'rails_helper'

describe 'admin/projects/new' do
  let(:project) { Project.new }

  before do
    assign(:project, project)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match /New Project/
  end

  it 'renders the project form' do
    expect(rendered).to match /Save/
  end
end