require 'rails_helper'

describe 'admin/shared/_validation' do
  let(:error_message) { 'There are error(s). Please fix them before trying again.' }

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
      expect(rendered).to include error_message
    end
  end

  context 'with no errors' do
    let(:invalid?) { false }
    let(:errors)   { nil }

    it 'does not display the validation errors title' do
      expect(rendered).not_to include error_message
    end
  end
end