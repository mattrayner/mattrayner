require 'rails_helper'

RSpec.describe CaseStudiesController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.code).to eq('200')
    end

    describe '@case_studies' do
      before do
        3.times { create(:case_study)  }

        @var = controller.instance_variable_get(:@case_studies)
      end

      it 'populates with the expected number of case studies' do
        expect(@var.size).to eq(3)
      end
    end
  end
end
