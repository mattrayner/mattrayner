require 'rails_helper'

describe 'admin/curriculum_vitaes/new' do
  let(:note) { nil }
  let(:file) { nil }

  let(:curriculum_vitae) do
    build(:curriculum_vitae,
          note: note,
          file: file)
  end

  before do
    assign(:curriculum_vitae, curriculum_vitae)

    render
  end

  it 'displays the page title' do
    expect(rendered).to match(/New CV/)
  end

  it 'renders the form fields' do
    expect(view).to render_template(partial: '_form_fields')
  end

  it 'renders the back button' do
    expect(rendered).to match(%r{>Back<\/a>})
  end

  it 'does not render the delete button' do
    expect(rendered).not_to match(/glyphicon-trash/)
  end
end
