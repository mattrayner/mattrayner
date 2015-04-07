require 'rails_helper'

RSpec.describe CaseStudy, type: :model do
  it_behaves_like 'it has a valid factory', :case_study

  subject { build(:case_study) }

  describe '#title' do
    it 'must be present' do
      subject.title = nil
      expect(subject.save).to be_falsey

      subject.title = 'title'
      expect(subject.save).to be_truthy
    end
  end

  describe '#body' do
    it 'must be present' do
      subject.body = nil
      expect(subject.save).to be_falsey

      subject.body = 'body'
      expect(subject.save).to be_truthy
    end
  end
end
