require 'rails_helper'

describe 'admin/projects/edit' do
  let(:title)   { 'Short' }
  let(:project) { create(:project, title: title) }

  before do
    assign(:project, project)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match /Edit\n'#{project.title}'/
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