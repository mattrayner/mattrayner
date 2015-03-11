require 'rails_helper'

describe 'admin/projects/shared/_project_row' do
  let(:id)      { 1 }
  let(:title)   { 'Give Cat' }
  let(:intro)   { 'A bit of intro text' }
  let(:body)    { 'A bit of body copy' }

  let(:project) { double(Project, id: id, title: title, intro: intro, body: body ) }

  before do
    render :partial => 'admin/projects/shared/project_row', :locals => { :project => project }
  end

  it 'renders the project title' do
    expect(rendered).to match /#{project.title}/
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