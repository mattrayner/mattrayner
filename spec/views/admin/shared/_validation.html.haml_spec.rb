require 'rails_helper'

describe 'admin/shared/_validation' do
  let(:message1) { [ 'title', ['Has a maximum of 24 character', 'Must begin with a number'] ] }
  let(:message2) { [ 'body', ['Must be present'] ] }
  let(:message3) { [ 'image', ['Must be present', 'Can be no taller that 250px'] ] }
  let(:messages) { [ message1, message2, message3 ] }
  let(:errors)   { double('errors', messages: messages) }
  let(:invalid?) { true }
  let(:object)   { double('Some Model', invalid?: invalid?, errors: errors) }

  before do
    render partial: 'admin/shared/validation', locals: { object: object }
  end

  context 'with errors' do
    it 'displays the validation errors title' do
      expect(rendered).to match /<h3>Validation Errors:<\/h3>/
    end

    it 'has an alert box present' do
      expect(rendered).to match /alert alert-danger/
    end

    context 'displaying error titles' do
      it 'displays all error message titles' do
        expect(rendered).to match /#{message1[0].capitalize}/
        expect(rendered).to match /#{message2[0].capitalize}/
        expect(rendered).to match /#{message3[0].capitalize}/
      end
    end

    context 'displaying error message messages' do
      it 'displays all error message titles for message1' do
        message1[1].each do |message|
          expect(rendered).to match /#{message}/
        end
      end

      it 'displays all error message titles for message2' do
        message2[1].each do |message|
          expect(rendered).to match /#{message}/
        end
      end

      it 'displays all error message titles for message3' do
        message3[1].each do |message|
          expect(rendered).to match /#{message}/
        end
      end
    end
  end

  context 'with no errors' do
    let(:invalid?) { false }
    let(:errors)   { nil }

    it 'does not display the validation errors title' do
      expect(rendered).not_to match /<h3>Validation Errors:<\/h3>/
    end

    it 'does not have an alert box present' do
      expect(rendered).not_to match /alert alert-danger/
    end
  end
end