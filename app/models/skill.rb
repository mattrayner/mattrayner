# @author Matthew Rayner
# @since 0.1
class Skill < ActiveRecord::Base
  validates :title,
            :level,
            presence: {
              message: I18n.t('.skill.title_validation')
            }
  validates_numericality_of :level,
                            greater_than_or_equal_to: 0.0,
                            less_than_or_equal_to: 100.0

  has_and_belongs_to_many :case_studies
end
