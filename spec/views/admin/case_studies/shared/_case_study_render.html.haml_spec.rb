require 'rails_helper'

describe 'admin/case_studies/shared/_case_study_render' do
  let(:id)             { 1 }
  let(:title)          { 'Give Cat' }
  let(:intro)          { 'A bit of intro text' }
  let(:body)           { 'A bit of body copy' }

  let(:case_study) do
    create(:case_study_with_gallery_images,
           id: id,
           title: title,
           intro: intro,
           body: body)
  end

  before do
    assign(:case_study, case_study)

    render partial: 'admin/case_studies/shared/case_study_render'
  end

  context 'with a header_image' do
    it 'renders the header image' do
      expect(rendered).to match(/#{case_study.header_image.banner.url}/)
    end
  end

  it 'renders the case study title' do
    expect(rendered).to match(%r{<h1>\n#{title}\n<\/h1>})
  end

  it 'renders the intro text' do
    expect(rendered).to match(%r{class='lead'>\n<p>#{intro}<\/p>\n\n<\/div>})
  end

  it 'renders the body text' do
    expect(rendered).to match(%r{<p>#{body}<\/p>})
  end

  context 'with MarkDown text' do
    let(:intro) { 'a bit of **bold** text' }
    let(:body) do
      <<-TEXT
##A H2
some text
*italics* and **bold**
      TEXT
    end

    it 'correctly converts the intro to HTML' do
      expect(rendered).to match(%r{a bit of <strong>bold<\/strong> text})
    end

    it 'correctly converts the body into HTML' do
      expect(rendered).to match(%r{<h2 id=\"a-h2\">A H2<\/h2>})
      expect(rendered).to match(%r{<p>some text\n<em>italics<\/em> and})
      expect(rendered).to match(%r{<strong>bold<\/strong><\/p>})
    end
  end

  it 'renders gallery images' do
    expect(rendered).to match(/#{case_study.gallery_images.first.title}/)
    expect(rendered).to match(/#{case_study.gallery_images.first.image.url}/)
  end
end
