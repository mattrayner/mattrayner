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

  describe '#show' do
    let(:case_study) { create(:case_study) }

    before do
      get :show, id: case_study.id
    end

    context 'with a valid ID' do
      it 'has a 200 status code' do
        expect(response.code).to eq('200')
      end

      it 'populates @case_study with our case study' do
        var = controller.instance_variable_get(:@case_study)
        expect(var).to eq(case_study)
      end
    end

    context 'with an invalid ID' do
      it 'throws a routing error' do
        expect do
          get :show, id: 1000
        end.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
