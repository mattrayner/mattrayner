require 'rails_helper'

describe 'admin/shared/_navigation' do
  let(:user) { double(User, gravatar_url: 'https://secure.gravatar.com/avatar/654c203f4d1c78392370aeb8325bbb58.png?r=PG&amp;s=18') }

  before do
    allow(view).to receive(:current_user).and_return(user)

    render
  end

  it 'renders the home link' do
    expect(rendered).to match /Matt Rayner Admin/
    expect(rendered).to match /glyphicon glyphicon-home/
  end

  it 'renders live site link' do
    expect(rendered).to match /Live Site/
  end

  it 'renders projects link' do
    expect(rendered).to match /Projects/
  end

  context 'user dropdown' do
    it 'renders the user gravatar' do
      expect(rendered).to match /https:\/\/secure.gravatar.com\/avatar\/654c203f4d1c78392370aeb8325bbb58.png/
    end

    it 'renders edit profile link' do
      expect(rendered).to match /Edit Profile/
    end

    it 'renders log out link' do
      expect(rendered).to match /Log Out/
    end
  end
end