class FitBitStats < ActiveRecord::Base
  validates :steps, :floors, presence: { message: 'Both floors and steps must be present' }
end