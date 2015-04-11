require 'rails_helper'

describe 'admin/case_studies/show' do
  let(:title)   { 'Give Cat' }
  let(:intro)   { 'A little intro' }
  let(:body)    { 'A bit of body' }
  let(:case_study) do
    create(:case_study,
           title: title,
           intro: intro,
           body: body)
  end

  before do
    assign(:case_study, case_study)

    render
  end

  it 'renders case study title' do
    expect(rendered).to match(/#{title}/)
  end

  it 'renders case study intro' do
    expect(rendered).to match(/#{intro}/)
  end

  it 'renders case study body' do
    expect(rendered).to match(/#{body}/)
  end

  it 'renders all case studies button' do
    expect(rendered).to match(/All Case Studies/)
  end

  it 'renders edit button' do
    expect(rendered).to match(/Edit Case Study/)
  end
end
