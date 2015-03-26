require 'rails_helper'

describe 'admin/projects/shared/_form.html.haml' do
  let(:title)        { nil }
  let(:intro)        { nil }
  let(:body)         { nil }
  let(:header_image) { nil }

  let(:project) { build(:project, title: title, intro: intro, body: body, header_image: header_image) }

  before do
    assign(:project, project)

    render
  end

  context 'with a new record' do
    it 'does not render the delete button' do
      expect(rendered).not_to match /glyphicon-trash/
    end
  end

  context 'with a saved record' do
    let(:title)   { 'Give Cat' }
    let(:intro)   { 'A intro!' }
    let(:body)    { 'Some body text' }
    let(:project) { create(:project, title: title, intro: intro, body: body, header_image: header_image) }

    it 'renders the title' do
      expect(rendered).to match /#{title}/
    end

    it 'renders the intro' do
      expect(rendered).to match /#{intro}/
    end

    it 'renders the body' do
      expect(rendered).to match /#{body}/
    end

    context 'with a header image' do
      let(:header_image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test_cat.png')) }

      it 'renders the header image' do
        expect(rendered).to match /test_cat.png/
      end
    end

    context 'with gallery iamges' do
      let(:project) { create(:project_with_gallery_images) }

      it 'renders the gallery images' do
        expect(project.gallery_images.empty?).to be_falsey

        project.gallery_images.each do |image|
          expect(rendered).to match /id='gallery-image-#{image.id}'/
        end
      end
    end

    it 'renders the delete button' do
      expect(rendered).to match /glyphicon-trash/
    end
  end
end