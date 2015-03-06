require 'rails_helper'

RSpec.describe Project, type: :model do
  it_behaves_like 'it has a valid factory', :project
end
