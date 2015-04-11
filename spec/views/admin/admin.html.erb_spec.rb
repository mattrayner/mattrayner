require 'rails_helper'

describe 'layouts/admin' do
  let(:url) do
    'https://secure.gravatar.com/avatar/654c203f4d1c78392370aeb8325bbb58.png'
  end

  let(:user) { double(User, gravatar_url: url) }

  before do
    allow(view).to receive(:current_user).and_return(user)

    render
  end

  it 'renders the header' do
    expect(rendered).to match(/Matt Rayner Admin/)
  end

  it 'renders the footer' do
    expect(rendered).to match(/&copy;\n([0-9]{4})\n/)
  end
end
