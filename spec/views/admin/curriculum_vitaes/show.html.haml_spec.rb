require 'rails_helper'

describe 'admin/curriculum_vitaes/show' do
  let(:note) { 'A little bit of text' }

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

  it 'renders the page title' do
    expect(rendered).to match(/Case Study Preview/)
  end

  it 'renders the download button' do
    expect(rendered).to match(/Download CV/)
    expect(rendered).to match(/#{curriculum_vitae.file.url}/)
  end

  context 'with a note' do
    it 'renders the note title' do
      expect(rendered).to match(/Notes/)
    end

    it 'renders the note body' do
      expect(rendered).to match(/#{note}/)
    end
  end

  context 'with no note' do
    let(:note) { nil }

    it 'doesn\'t render the note title' do
      expect(rendered).not_to match(/Notes/)
    end
  end

  it 'renders the All CVs button' do
    expect(rendered).to match(/All CVs/)
  end

  it 'renders the edit button' do
    expect(rendered).to match(/Edit CV/)
  end
end
