require 'rails_helper'

describe 'shared/_footer.html.haml' do
  let(:fitbit_stats) { create(:fit_bit_stats, steps: 9876, floors: 12) }

  before do
    assign(:fitbit_stats, fitbit_stats)

    render partial: 'shared/footer'
  end

  it 'renders the website gem logo' do
    expect(rendered).to match(/<a class="mattrayner-gem-logo ir" href="http:/)
  end

  describe 'FitBit section' do
    context 'with fitbit stats' do
      it 'renders the FitBit title' do
        expect(rendered).to match(/Breaking a sweat/)
      end

      it 'renders the descriptive text' do
        expect(rendered).to match(/I'm not just a desk jockey/)
      end

      it 'renders the steps count' do
        expect(rendered).to match(/9,876\nsteps./)
      end

      it 'renders the floor count' do
        expect(rendered).to match(/12\nfloors./)
      end
    end

    context 'with no stats' do
      let(:fitbit_stats) { nil }

      it 'does not render the FitBit title' do
        expect(rendered).not_to match(/Breaking a sweat/)
      end
    end
  end

  it 'renders the copyright message' do
    expect(rendered).to match(/Copyright ©#{Time.now.year}\n<a href=\"http:/)
  end
end
