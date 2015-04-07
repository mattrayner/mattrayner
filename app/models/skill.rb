class Skill < ActiveRecord::Base
  validates :title, :level, presence: true
  validates_numericality_of :level, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0

  has_and_belongs_to_many :case_studies
end
