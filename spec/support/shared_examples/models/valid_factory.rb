shared_examples 'it has a valid factory' do |factory|
  it 'has a valid factory' do
    expect(create(factory).valid?).to be_truthy
  end
end