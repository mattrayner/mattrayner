require 'rails_helper'

describe 'admin/skills/index' do
  let(:skills_array) do
    [ create(:skill), create(:skill) ]
  end

  before do
    assign(:skills, skills_array)

    render
  end

  context 'with multiple skills' do
    it 'renders the page header' do
      expect(rendered).to match /<h1>\nSkills\n<small>#{skills_array.count}<\/small>\n<\/h1>\n/
    end

    it 'renders multiple product rows' do
      expect(view).to render_template(partial: 'admin/skills/shared/_skill_row', count: skills_array.count)
    end
  end

  context 'with no skills' do
    let(:skills_array) { [] }

    it 'renders the page header' do
      expect(rendered).to match /<h1>\nSkills\n<small>0<\/small>\n<\/h1>\n/
    end

    it 'renders the placeholder table row' do
      expect(rendered).to match /Please\n<a href=\"\/admin\/skills\/new\">add a skill<\/a>\nto see it here.\n/
    end
  end
end