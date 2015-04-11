require 'rails_helper'

describe 'admin/curriculum_vitaes/edit' do
  let(:note) { 'A note about the epicness of this whole epic epicness' }

  file = File.join(Rails.root, 'spec', 'support', 'files', 'test_pdf.pdf')
  let(:uploaded_file) { Rack::Test::UploadedFile.new(file) }

  let(:curriculum_vitae) do
    create(:curriculum_vitae,
           note: note,
           file: uploaded_file)
  end

  before do
    assign(:curriculum_vitae, curriculum_vitae)

    render
  end

  it 'displays the page title' do
    expect(rendered).to match(/Edit CV/)
  end

  it 'renders the form fields' do
    expect(view).to render_template(partial: '_form_fields')
  end

  it 'renders the back button' do
    expect(rendered).to match(%r{>Back<\/a>})
  end

  it 'renders the delete button' do
    expect(rendered).to match(/glyphicon-trash/)
  end
end
