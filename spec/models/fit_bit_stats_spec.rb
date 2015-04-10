require 'rails_helper'

RSpec.describe CaseStudy, type: :model do
  it_behaves_like 'it has a valid factory', :fit_bit_stats
end