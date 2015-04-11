require 'rails_helper'

describe 'admin/shared/_validation' do
  let(:error_message) do
    "<strong>Warning</strong>\nThere are\n<strong>3</strong>\nerror(s)"
  end

  let(:message1) do
    [
      'title',
      [
        'Has a maximum of 24 character',
        'Must begin with a number'
      ]
    ]
  end
  let(:message2) do
    [
      'body',
      [
        'Must be present'
      ]
    ]
  end
  let(:message3) do
    [
      'image',
      [
        'Must be present',
        'Can be no taller that 250px'
      ]
    ]
  end
  let(:messages) { [message1, message2, message3] }
  let(:errors)   { double('errors', messages: messages, any?: true, count: 3) }
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
    let(:errors)   { {} }

    it 'does not display the validation errors title' do
      expect(rendered).not_to include error_message
    end
  end
end
