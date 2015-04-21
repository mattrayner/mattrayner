require 'rails_helper'

RSpec.describe SkillsController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.code).to eq('200')
    end

    describe '@skills' do
      before do
        3.times { create(:skill)  }

        @var = controller.instance_variable_get(:@skills)
      end

      it 'populates with the expected number of skills' do
        expect(@var.size).to eq(3)
      end
    end
  end
end
