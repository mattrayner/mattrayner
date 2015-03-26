require 'rails_helper'

describe ApplicationHelper do
  describe '#markdown' do
    let(:md) {
<<-TEXT
#Title
Paragraph
TEXT
}

    subject { markdown(md) }

    it 'successfully converts markdown' do
      expect(subject).to eq("<h1 id=\"title\">Title</h1>\n<p>Paragraph</p>\n")
    end
  end
end