require 'rails_helper'

describe 'case_studies/shared/_case_study_listing.html.haml' do
  let(:case_study) { create(:case_study) }

  before do
    render partial: 'case_studies/shared/case_study_listing',
           locals: {
             case_study: case_study
           }
  end

  describe 'full bleed image' do
    it 'renders the expected full bleed image div' do
      expect(rendered).to match(/<div class='full-bleed-image data-image bleed/)
    end

    it 'includes the expected data tags' do
      expect(rendered).to match(%r{data-image='/uploads/case_study/header_imag})
      expect(rendered).to match(%r{data-large-image='/uploads/case_study/heade})
    end
  end

  describe 'listing content' do
    it 'includes the title' do
      expect(rendered).to match(/Give Cat/)
    end

    it 'includes the intro' do
      expect(rendered).to match(/<p>A bookmarklet to replace all the images /)
    end

    describe 'skills' do
      it 'includes the expected skills' do
        expect(rendered).to match(/Ruby/)
      end
    end

    it 'includes the view more button' do
      expect(rendered).to match(/See More/)
    end
  end
end
