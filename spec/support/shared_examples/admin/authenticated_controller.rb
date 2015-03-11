shared_examples 'an authenticated controller' do |action, params|
  describe 'as logged in user' do
    before do
      sign_in create(:user)
    end

    describe "#{action}" do
      before do
        get action.to_sym, params
      end

      it 'returns a 200 status code' do
        expect(response.code).to eq('200')
      end
    end
  end

  describe 'as a *not* logged in user' do
    it 'redirects the user away' do
      get action.to_sym
      expect(response.code).to eq('302')
    end
  end
end