require 'rails_helper'

describe 'admin/skills/edit' do
  let(:id)    { 3 }
  let(:title) { 'Ruby' }
  let(:level) { 54.5 }

  let(:skill) { create(:skill, id: id, title: title, level: level) }

  before do
    assign(:skill, skill)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match(/Edit '#{title}'/)
  end

  it 'renders the form fields' do
    expect(view).to render_template(partial: 'admin/skills/shared/_form_fields')
  end

  describe 'form fields' do
    it 'renders the delete button' do
      expect(rendered).to match(/glyphicon-trash/)
    end
  end
end
