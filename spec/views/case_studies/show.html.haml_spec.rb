require 'rails_helper'

describe 'case_studies/show.html.haml' do
  let(:case_study) { create(:case_study) }

  before do
    assign(:case_study, case_study)

    render
  end

  describe 'page header' do
    it 'renders the case study image' do
      expect(rendered).to match(/#{case_study.header_image.banner.url}/)
    end

    it 'renders the case studt title' do
      expect(rendered).to match(/#{case_study.title}/)
    end

    it 'renders the body' do
      expect(rendered).to match(/#{case_study.body}/)
    end

    describe 'skills' do
      context 'with skills' do
        it 'renders the Skills title' do
          expect(rendered).to match(/Skills/)
        end
      end

      context 'without skills' do
        it 'does not render the Skills title' do
          expect(rendered).not_to match(/Skills/)
        end
      end
    end
  end
end
