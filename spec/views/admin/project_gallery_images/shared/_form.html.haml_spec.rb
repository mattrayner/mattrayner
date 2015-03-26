require 'rails_helper'

describe 'admin/project_gallery_images/shared/_form.html.haml' do
  let(:title)                 { 'Give Cat' }
  let(:project_gallery_image) { create(:project_gallery_image, title: title) }

  before do
    assign(:project_gallery_image, project_gallery_image)

    render
  end

  it 'renders the title' do
    expect(rendered).to match /#{title}/
  end

  context 'with an image' do
    let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'mega_fone.png')) }
    let(:project_gallery_image) { create(:project_gallery_image, title: title, image: image) }

    it 'renders the header image' do
      expect(rendered).to match /mega_fone.png/
    end
  end
end