# @author Matthew Rayner
# @since 0.1
class Skill < ActiveRecord::Base
  validates :title,
            :level,
            presence: {
              message: I18n.t('.skill.title_validation')
            }
  validates :svg_logo,
            :image_logo,
            presence: {
              message: I18n.t('.skill.logo_validation')
            }

  mount_uploader :svg_logo, SvgUploader
  mount_uploader :image_logo, LogoUploader

  validates_numericality_of :level,
                            greater_than_or_equal_to: 0.0,
                            less_than_or_equal_to: 100.0

  has_and_belongs_to_many :case_studies
end
