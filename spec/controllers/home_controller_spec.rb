require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.code).to eq('200')
    end

    describe '@cv_url' do
      context 'when there are no CVs' do
        it 'populates cv_url as nil' do
          var = controller.instance_variable_get(:@cv_url)
          expect(var).to be_nil
        end
      end

      context 'when there is a CV' do
        before do
          create(:curriculum_vitae)

          get :index
        end

        it 'populates cv_url' do
          var = controller.instance_variable_get(:@cv_url)
          expect(var).not_to be_nil
        end
      end
    end
  end
end
