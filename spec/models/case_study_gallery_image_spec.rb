require 'rails_helper'

RSpec.describe CaseStudyGalleryImage, type: :model do
  it_behaves_like 'it has a valid factory', :case_study

  subject { CaseStudyGalleryImage.new }

  describe '#image' do
    it 'must be present' do
      subject.image = nil
      expect(subject.save).to be_falsey

      file = File.join(Rails.root, 'spec', 'support', 'files', 'test_cat.png')
      subject.image = Rack::Test::UploadedFile.new(file)

      expect(subject.save).to be_truthy
    end
  end
end
