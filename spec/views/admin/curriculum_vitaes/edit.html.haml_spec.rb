require 'rails_helper'

describe 'admin/curriculum_vitaes/edit' do
  let(:note) { 'A note about the epicness of this whole epic epicness' }
  let(:file) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test_pdf.pdf')) }

  let(:curriculum_vitae) { create(:curriculum_vitae, note: note, file: file) }

  before do
    assign(:curriculum_vitae, curriculum_vitae)

    render
  end

  it 'displays the page title' do
    expect(rendered).to match /Edit CV/
  end

  it 'renders the form fields' do
    expect(view).to render_template(partial: '_form_fields')
  end

  it 'renders the back button' do
    expect(rendered).to match />Back<\/a>/
  end

  it 'renders the delete button' do
    expect(rendered).to match /glyphicon-trash/
  end
end