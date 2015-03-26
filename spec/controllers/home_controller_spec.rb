require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it 'has a 200 status code' do
      expect(response.code).to eq('200')
    end
  end
end
