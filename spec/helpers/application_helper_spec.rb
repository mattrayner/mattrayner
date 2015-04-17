require 'rails_helper'

describe ApplicationHelper do
  describe '#markdown' do
    let(:md) do
      <<-TEXT
#Title
Paragraph
      TEXT
    end

    subject { markdown(md) }

    it 'successfully converts markdown' do
      expect(subject).to eq("<h1 id=\"title\">Title</h1>\n<p>Paragraph</p>\n")
    end
  end

  describe '#build_breadcrumbs' do
    let(:children) do
      [{ title: 'A title', url: '/a/path' }]
    end

    subject { build_breadcrumbs(children) }

    context 'with children' do
      it 'renders the expected string' do
        s = "</a>\n<div class='crumb' itemprop='child' itemscope itemtype='http"
        expect(subject).to include(s)

        s = "<a href='/a/path' itemprop='url'>\n"
        expect(subject).to include(s)

        s = "<span itemprop='title'>\nA title\n</span>"
        expect(subject).to include(s)
      end
    end

    context 'without children' do
      let(:children) { nil }

      it 'renders the expected string' do
        s = "<div class='crumb' itemscope itemtype='http://data-vocabulary.org/"
        expect(subject).to include(s)

        s = "<a href='http://test.host/' itemprop='url'>\n"
        expect(subject).to include(s)

        s = "<span itemprop='title'>\nMatt Rayner\n</span>"
        expect(subject).to include(s)
      end
    end
  end
end
