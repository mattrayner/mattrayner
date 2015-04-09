require 'rails_helper'

describe 'admin/case_studies/index' do
  let(:case_studies_array) do
    [ create(:case_study, title: 'Case Study 1', id: 1), create(:case_study, title: 'Case Study 2', id: 2) ]
  end

  before do
    assign(:case_studies, case_studies_array)

    render
  end

  context 'with multiple case studies' do
    it 'renders the page header' do
      expect(rendered).to match /<h1>\nCase Studies\n<small>#{case_studies_array.count}<\/small>\n<\/h1>\n/
    end

    it 'renders multiple product rows' do
      expect(view).to render_template(partial: 'admin/case_studies/shared/_case_study_row', count: case_studies_array.count)
    end
  end

  context 'with no case studies' do
    let(:case_studies_array) { [] }

    it 'renders the page header' do
      expect(rendered).to match /<h1>\nCase Studies\n<small>0<\/small>\n<\/h1>\n/
    end

    it 'renders the placeholder table row' do
      expect(rendered).to match /Please\n<a href=\"\/admin\/case_studies\/new\">add a case study<\/a>\nto see it here.\n/
    end
  end
end