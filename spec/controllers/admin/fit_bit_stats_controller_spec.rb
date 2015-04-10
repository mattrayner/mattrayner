require 'rails_helper'

describe Admin::FitBitStatsController do
  context 'with a signed in user' do
    before do
      sign_in create(:user)
    end

    describe '#index' do
      before do
        @stats = create(:fit_bit_stats)

        get :index
      end

      it 'populates @fit_bit_stats with the latest FitBitStats object' do
        instance_stats = controller.instance_variable_get(:@fit_bit_stats)

        expect(instance_stats).to eq(@stats)
      end
    end
  end
end
