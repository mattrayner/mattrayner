# @author Matthew Rayner
# @since 0.1
class CaseStudy < ActiveRecord::Base
  validates :title,
            presence: { message: I18n.t('.case_study.title_validation') }
  validates :body,
            presence: { message: I18n.t('.case_study.body_validation') }
  validates_length_of :title, maximum: 255

  mount_uploader :header_image, HeaderUploader

  has_many :gallery_images,
           foreign_key: 'case_study_id',
           class_name: 'CaseStudyGalleryImage'
  accepts_nested_attributes_for :gallery_images

  has_and_belongs_to_many :skills
end
