require 'rails_helper'

describe 'case_studies/index.html.haml' do
  let(:case_studies) do
    [
      create(:case_study),
      create(:case_study)
    ]
  end

  before do
    assign(:case_studies, case_studies)

    render
  end

  describe 'header' do
    it 'renders the title' do
      expect(rendered).to match(/<span class='sr-only'>\n<h1>Case Studies/)
    end

    it 'has a divider' do
      expect(rendered).to match(/class='header-divider'/)
    end
  end

  describe 'case studies' do
    it 'renders multiple case study listings' do
      partial = 'case_studies/shared/_case_study_listing'
      expect(view).to render_template(partial: partial, count: 2)
    end
  end
end
