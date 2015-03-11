require 'rails_helper'

describe 'admin/projects/edit' do
  let(:title)   { nil }
  let(:project) { Project.new(id: 1, title: title) }

  before do
    assign(:project, project)

    render
  end

  context 'with no project title' do
    it 'renders the generic page title' do
      expect(rendered).to match /Edit\nProject/
    end
  end

  context 'with a project title' do
    let(:title)   { 'Give Cat' }

    it 'renders the page title' do
      expect(rendered).to match /Edit\n'#{project.title}'/
    end

    it 'renders the project form' do
      expect(rendered).to match /Save/
    end
  end
end