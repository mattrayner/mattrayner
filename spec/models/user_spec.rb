require 'rails_helper'

RSpec.describe User, type: :model do
  it_behaves_like 'it has a valid factory', :user
end
