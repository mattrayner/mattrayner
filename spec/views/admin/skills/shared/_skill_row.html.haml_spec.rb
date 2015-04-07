require 'rails_helper'

describe 'admin/skills/shared/_skill_row' do
  let(:id)      { 1 }
  let(:title)   { 'Ruby' }
  let(:level)   { 53.75 }

  let(:skill) { create(:skill, id: id, title: title, level: level) }

  before do
    render :partial => 'admin/skills/shared/skill_row', :locals => { :skill => skill }
  end

  it 'renders the case study title' do
    expect(rendered).to match /#{skill.title}/
  end

  it 'has a glyphicon delete button' do
    expect(rendered).to match /glyphicon-trash/
    expect(rendered).to match /Edit/
  end

  it 'had a glyphicon edit button' do
    expect(rendered).to match /glyphicon-pencil/
    expect(rendered).to match /Delete/
  end
end