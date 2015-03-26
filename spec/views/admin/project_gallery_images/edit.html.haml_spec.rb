require 'rails_helper'

describe 'admin/project_gallery_images/edit' do
  let(:title)                 { 'Short' }
  let(:project_gallery_image) { create(:project_gallery_image, title: title) }

  before do
    assign(:project_gallery_image, project_gallery_image)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match /Edit\n'#{project_gallery_image.title}'/
  end

  it 'renders the project form' do
    expect(rendered).to match /Save/
  end

  context 'with a long title' do
    let(:title)   { 'Give Cat - The Bookmarklet you never knew you needed!' }

    it 'concatenates after X number of characters' do
      expect(rendered).to match /Edit\n'Give Ca...'/
    end
  end
end