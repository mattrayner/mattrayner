require 'rails_helper'

describe 'admin/case_study_gallery_images/edit' do
  let(:title)                 { 'Short' }
  let(:case_study_gallery_image) do
    create(:case_study_gallery_image,
           title: title)
  end

  before do
    assign(:case_study_gallery_image, case_study_gallery_image)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match(/Edit\n'#{case_study_gallery_image.title}'/)
  end

  it 'renders the case study form' do
    expect(rendered).to match(/Save/)
  end

  context 'with a long title' do
    let(:title)   { 'Give Cat - The Bookmarklet you never knew you needed!' }

    it 'concatenates after X number of characters' do
      expect(rendered).to match(/Edit\n'Give Ca...'/)
    end
  end

  describe 'form fields' do
    let(:title)                 { 'Give Cat' }
    let(:case_study_gallery_image) do
      create(:case_study_gallery_image,
             title: title)
    end

    it 'renders the title' do
      expect(rendered).to match(/value="#{title}"/)
    end

    context 'with an image' do
      file = File.join(Rails.root, 'spec', 'support', 'files', 'mega_fone.png')
      let(:image) { Rack::Test::UploadedFile.new(file) }
      let(:case_study_gallery_image) do
        create(:case_study_gallery_image,
               title: title,
               image: image)
      end

      it 'renders the header image' do
        expect(rendered).to match(/mega_fone.png/)
      end
    end
  end
end
