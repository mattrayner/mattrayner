require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do
  it_behaves_like 'it has a valid factory', :curriculum_vitae

  subject { CurriculumVitae.new }

  describe '#file' do
    it 'must be present' do
      subject.file = nil
      expect(subject.save).to be_falsey

      file = File.join(Rails.root, 'spec', 'support', 'files', 'test_pdf.pdf')
      subject.file = Rack::Test::UploadedFile.new(file)
      expect(subject.save).to be_truthy
    end
  end
end
