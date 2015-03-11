require 'rails_helper'

describe 'admin/projects/show' do
  let(:title)   { 'Give Cat' }
  let(:intro)   { 'A little intro' }
  let(:body)    { 'A bit of body' }
  let(:project) { create(:project, title: title, intro: intro, body: body ) }

  before do
    assign(:project, project)

    render
  end

  it 'renders project title' do
    expect(rendered).to match /#{title}/
  end

  it 'renders project intro' do
    expect(rendered).to match /#{intro}/
  end

  it 'renders project body' do
    expect(rendered).to match /#{body}/
  end

  it 'renders all projects button' do
    expect(rendered).to match /All Projects/
  end

  it 'renders edit button' do
    expect(rendered).to match /Edit Project/
  end
end