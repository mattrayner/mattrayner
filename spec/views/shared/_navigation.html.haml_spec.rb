require 'rails_helper'

describe 'shared/_navigation.html.haml' do
  let(:cv) { create(:curriculum_vitae) }

  before do
    assign(:cv_url, cv.file.url)

    render partial: 'shared/navigation'
  end

  it 'renders the website logo' do
    expect(rendered).to match(/<a class="navbar-brand mattrayner-logo ir"/)
  end

  it 'renders the Home link' do
    expect(rendered).to match(/Home/)
  end

  it 'renders the Case Studies link' do
    expect(rendered).to match(/Case Studies/)
  end

  it 'renders the Skills link' do
    expect(rendered).to match(/Skills/)
  end

  it 'renders the My CV link' do
    expect(rendered).to match(/Get My CV/)
  end
end
