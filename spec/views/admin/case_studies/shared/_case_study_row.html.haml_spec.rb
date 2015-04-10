require 'rails_helper'

describe 'admin/case_studies/shared/_case_study_row' do
  let(:id)      { 1 }
  let(:title)   { 'Give Cat' }
  let(:intro)   { 'A bit of intro text' }
  let(:body)    { 'A bit of body copy' }
  let(:header_image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'mega_fone.png')) }

  let(:case_study) { create(:case_study, id: id, title: title, intro: intro, body: body, header_image: header_image ) }

  before do
    render :partial => 'admin/case_studies/shared/case_study_row', :locals => { :case_study => case_study }
  end

  it 'renders the header thumbnail image' do
    expect(rendered).to match /\/uploads\/case_study\/header_image\/1\/thumb_mega_fone.png/
  end

  it 'renders the case study title' do
    expect(rendered).to match /#{case_study.title}/
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