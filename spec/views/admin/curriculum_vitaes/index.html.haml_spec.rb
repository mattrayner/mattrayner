require 'rails_helper'

describe 'admin/curriculum_vitaes/index' do
  let(:cv_array) do
    [
      create(:curriculum_vitae,
             note: 'cv 1',
             id: 1),
      create(:curriculum_vitae,
             note: 'cv 2',
             id: 2)
    ]
  end

  before do
    assign(:curriculum_vitaes, cv_array)

    render
  end

  context 'with multiple cvs' do
    it 'renders the page header' do
      expect(rendered).to match(%r{<small>#{cv_array.count}<\/small>})
    end
  end

  context 'with no cvs' do
    let(:cv_array) { [] }

    it 'renders the page header' do
      expect(rendered).to match(%r{<small>0<\/small>})
    end
  end
end
