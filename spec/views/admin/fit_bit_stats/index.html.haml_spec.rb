require 'rails_helper'

describe 'admin/fit_bit_stats/index' do
  let(:fit_bit_stats) { create(:fit_bit_stats, steps: 1234, floors: 56) }
  let(:fit_bit_history) do
    [
        create(:fit_bit_stats, steps: 1011, floors: 4),
        create(:fit_bit_stats, steps: 789, floors: 3),
        create(:fit_bit_stats, steps: 456, floors: 2),
        create(:fit_bit_stats, steps: 123, floors: 1),
        create(:fit_bit_stats, steps: 0, floors: 0)
    ]
  end
  before do
    assign(:fit_bit_stats, fit_bit_stats)
    assign(:fit_bit_history, fit_bit_history)

    render
  end

  it 'renders the page header' do
    expect(rendered).to match /FitBit Stats/
  end

  it 'renders the current stats title' do
    expect(rendered).to match /Current Stats:/
  end

  it 'renders the number of steps' do
    expect(rendered).to match /1234/
  end

  it 'renders the number of floors' do
    expect(rendered).to match /56/
  end

  it 'renders the history title' do
    expect(rendered).to match /History:/
  end

  describe 'history rows' do
    it 'renders the history rows' do
      fit_bit_history.each do |stat|
        Rails.logger.debug "Testing presence of stat: #{stat.inspect} in history"
        expect(rendered).to match /<td>#{stat.steps}<\/td>\n<td>#{stat.floors}<\/td>/
      end
    end
  end
end