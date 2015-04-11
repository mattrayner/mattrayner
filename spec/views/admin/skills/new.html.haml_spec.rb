require 'rails_helper'

describe 'admin/skills/new' do
  let(:id)    { nil }
  let(:title) { nil }
  let(:level) { nil }

  let(:skill) { build(:skill, id: id, title: title, level: level) }

  before do
    assign(:skill, skill)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match(/New Skill/)
  end

  it 'renders the form fields' do
    expect(view).to render_template(partial: 'admin/skills/shared/_form_fields')
  end

  describe 'form fields' do
    context 'with a new record' do
      it 'does not render the delete button' do
        expect(rendered).not_to match(/glyphicon-trash/)
      end
    end
  end
end
