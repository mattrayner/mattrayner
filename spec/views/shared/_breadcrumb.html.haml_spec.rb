require 'rails_helper'

describe 'shared/_breadcrumb.html.haml' do
  let(:crumb) do
    { title: 'A title', url: '/a/path/' }
  end
  let(:children) { '!!! CHILD CODE GOES HERE !!!' }
  let(:root) { true }

  before do
    render partial: 'shared/breadcrumb',
           locals: {
             crumb: crumb,
             children: children,
             root: root
           }
  end

  context 'as root' do
    it 'does not include the itemprop="child" attribute' do
      expect(rendered).not_to match(/itemprop='child'/)
    end
  end

  context 'not root' do
    let(:root) { false }

    it 'renders the data-root tas as false' do
      expect(rendered).to match(/itemprop='child'/)
    end
  end

  it 'renders child code' do
    expect(rendered).to match(/#{children}/)
  end
end
