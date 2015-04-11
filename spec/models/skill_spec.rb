require 'rails_helper'

RSpec.describe Skill, type: :model do
  it_behaves_like 'it has a valid factory', :skill

  subject { build(:skill) }

  describe '#level' do
    it 'has a minimum value of 0.0' do
      subject.level = -0.1
      expect(subject.save).to be_falsey
    end

    it 'has a maximum value of 100.0' do
      subject.level = 100.1
      expect(subject.save).to be_falsey
    end

    it 'saves a number within the range 0-100' do
      subject.level = 50.0
      expect(subject.save).to be_truthy
    end
  end
end
