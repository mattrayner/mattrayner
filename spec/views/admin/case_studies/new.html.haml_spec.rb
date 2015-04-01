require 'rails_helper'

describe 'admin/case_studies/new' do
  let(:title)        { nil }
  let(:intro)        { nil }
  let(:body)         { nil }
  let(:header_image) { nil }

  let(:case_study) { build(:case_study, title: title, intro: intro, body: body, header_image: header_image) }

  before do
    assign(:case_study, case_study)

    render
  end

  it 'renders the page title' do
    expect(rendered).to match /New Case Study/
  end

  it 'renders the case study form' do
    expect(rendered).to match /Save/
  end

  describe 'form fields' do
    context 'with a new record' do
      it 'does not render the delete button' do
        expect(rendered).not_to match /glyphicon-trash/
      end
    end
  end
end