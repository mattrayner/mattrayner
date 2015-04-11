require 'rails_helper'

describe 'admin/case_studies/edit' do
  let(:title)   { 'Short' }
  let(:case_study) { create(:case_study, title: title) }

  before do
    assign(:case_study, case_study)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match(/Edit\n'#{case_study.title}'/)
  end

  it 'renders the case study form' do
    partial = 'admin/case_studies/shared/_form_fields'
    expect(view).to render_template(partial: partial)
  end

  context 'with a long title' do
    let(:title)   { 'Give Cat - The Bookmarklet you never knew you needed!' }

    it 'concatenates after X number of characters' do
      expect(rendered).to match(/Edit\n'Give Ca...'/)
    end
  end

  describe 'form fields' do
    context 'with a saved record' do
      let(:title)        { 'Give Cat' }
      let(:intro)        { 'A intro!' }
      let(:body)         { 'Some body text' }
      let(:header_image) { nil }
      let(:case_study)   do
        create(:case_study,
               title: title,
               intro: intro,
               body: body,
               header_image: header_image)
      end

      it 'renders the title' do
        expect(rendered).to match(/#{title}/)
      end

      it 'renders the intro' do
        expect(rendered).to match(/#{intro}/)
      end

      it 'renders the body' do
        expect(rendered).to match(/#{body}/)
      end

      context 'with a header image' do
        file = File.join(Rails.root, 'spec', 'support', 'files', 'test_cat.png')
        let(:header_image) { Rack::Test::UploadedFile.new(file) }

        it 'renders the header image' do
          expect(rendered).to match(/test_cat.png/)
        end
      end

      context 'with gallery iamges' do
        let(:case_study) { create(:case_study_with_gallery_images) }

        it 'renders the gallery images' do
          expect(case_study.gallery_images.empty?).to be_falsey

          case_study.gallery_images.each do |image|
            expect(rendered).to match(/id='gallery-image-#{image.id}'/)
          end
        end
      end

      it 'renders the delete button' do
        expect(rendered).to match(/glyphicon-trash/)
      end
    end
  end
end
