require 'rails_helper'

describe 'admin/skills/show' do
  let(:title) { 'Ruby' }
  let(:level) { 99.43 }

  let(:skill) { create(:skill_with_case_studies, title: title, level: level) }

  before do
    assign(:skill, skill)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match(/Skill Preview/)
  end

  it 'renders the skill title' do
    expect(rendered).to match(%r{<h2>\n#{title}\n<\/h2>})
  end

  it 'renderd the skill progress bar' do
    expect(rendered).to match(/style='width: #{level}%;'/)
  end

  it 'renders the edit link' do
    expect(rendered).to match(%r{\/admin\/skills\/#{skill.id}})
  end

  context 'case studies' do
    it 'displays the case studies linked to a skill' do
      expect(rendered).to match(/skill-case-study/)
    end
  end
end
