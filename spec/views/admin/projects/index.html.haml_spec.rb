require 'rails_helper'

describe 'admin/projects/index' do
  let(:projects_array) do
    [ double(Project, title: 'Project 1', id: 1), double(Project, title: 'Project 2', id: 2) ]
  end

  before do
    assign(:projects, projects_array)

    render
  end

  context 'with multiple projects' do
    it 'renders the page header' do
      expect(rendered).to match /<h1>\nProjects\n<small>#{projects_array.count}<\/small>\n<\/h1>\n/
    end

    it 'renders multiple product rows' do
      expect(view).to render_template(partial: 'admin/projects/shared/_project_row', count: projects_array.count)
    end
  end

  context 'with no projects' do
    let(:projects_array) { [] }

    it 'renders the page header' do
      expect(rendered).to match /<h1>\nProjects\n<small>0<\/small>\n<\/h1>\n/
    end

    it 'renders the placeholder table row' do
      expect(rendered).to match /Please\n<a href=\"\/admin\/projects\/new\">add a project<\/a>\nto see it here.\n/
    end
  end
end