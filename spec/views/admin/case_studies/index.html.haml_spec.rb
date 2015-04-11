require 'rails_helper'

describe 'admin/case_studies/index' do
  let(:case_studies_array) do
    [
      create(:case_study,
             title: 'Case Study 1',
             id: 1),
      create(:case_study,
             title: 'Case Study 2',
             id: 2)
    ]
  end

  before do
    assign(:case_studies, case_studies_array)

    render
  end

  context 'with multiple case studies' do
    it 'renders the page header' do
      expect(rendered).to match(/<small>#{case_studies_array.count}</)
    end

    it 'renders multiple product rows' do
      partial = 'admin/case_studies/shared/_case_study_row'
      expect(view).to render_template(partial: partial, count: 2)
    end
  end

  context 'with no case studies' do
    let(:case_studies_array) { [] }

    it 'renders the page header' do
      expect(rendered).to match(/<small>0</)
    end

    it 'renders the placeholder table row' do
      expect(rendered).to match(%r{add a case study<\/a>\nto see it here.\n})
    end
  end
end
