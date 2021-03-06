require 'rails_helper'

describe 'admin/shared/_navigation' do
  let(:url) do
    'https://secure.gravatar.com/avatar/654c203f4d1c78392370aeb8325bbb58.png'
  end

  let(:user) { double(User, gravatar_url: url) }

  before do
    allow(view).to receive(:current_user).and_return(user)

    render
  end

  it 'renders the home link' do
    expect(rendered).to match(/Matt Rayner Admin/)
    expect(rendered).to match(/glyphicon glyphicon-home/)
  end

  it 'renders live site link' do
    expect(rendered).to match(/Live Site/)
  end

  it 'renders case studies link' do
    expect(rendered).to match(/Case Studies/)
  end

  it 'renders skills link' do
    expect(rendered).to match(/Skills/)
  end

  it 'renders cvs link' do
    expect(rendered).to match(/CVs/)
  end

  context 'user dropdown' do
    it 'renders the user gravatar' do
      expect(rendered).to match(/#{url}/)
    end

    it 'renders edit profile link' do
      expect(rendered).to match(/Edit Profile/)
    end

    it 'renders log out link' do
      expect(rendered).to match(/Log Out/)
    end
  end
end
