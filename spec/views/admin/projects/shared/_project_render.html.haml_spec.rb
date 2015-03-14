require 'rails_helper'

describe 'admin/projects/shared/_project_render' do
  let(:id)            { 1 }
  let(:title)         { 'Give Cat' }
  let(:intro)         { 'A bit of intro text' }
  let(:body)          { 'A bit of body copy' }
  let(:header_image)  { double(HeaderUploader, url: '/path/to/image.jpg') }
  let(:header_image?) { true }

  let(:project) { double(Project, id: id, title: title, intro: intro, body: body, header_image: header_image, header_image?: header_image? ) }

  before do
    assign(:project, project)

    render :partial => 'admin/projects/shared/project_render'
  end

  context 'with a header_image' do
    it 'renders the header image' do
      expect(rendered).to match /#{header_image.url}/
    end
  end

  context 'with no header_image' do
    let(:header_image?) { false }

    it 'does not render the header_image' do
      expect(rendered).not_to match /#{header_image.url}/
    end
  end

  it 'renders the project title' do
    expect(rendered).to match /<h1>\n#{title}\n<\/h1>/
  end

  it 'renders the intro text' do
    expect(rendered).to match /<div class='lead'>\n<p>#{intro}<\/p>\n\n<\/div>/
  end

  it 'renders the body text' do
    expect(rendered).to match /<p>#{body}<\/p>/
  end

  context 'with MarkDown text' do
    let(:intro){ 'a bit of **bold** text' }
    let(:body) do
'##A H2
some text
*italics* and **bold**'
    end

    it 'correctly converts the intro to HTML' do
      expect(rendered).to match /a bit of <strong>bold<\/strong> text/
    end

    it 'correctly converts the body into HTML' do
      expect(rendered).to match /<h2 id=\"a-h2\">A H2<\/h2>\n<p>some text\n<em>italics<\/em> and <strong>bold<\/strong><\/p>/
    end
  end
end