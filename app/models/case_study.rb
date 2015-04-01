class CaseStudy < ActiveRecord::Base
  validates :title, :body, presence: true
  validates_length_of :title, maximum: 255

  mount_uploader :header_image, HeaderUploader

  has_many :gallery_images, :foreign_key => 'case_study_id', :class_name => 'CaseStudyGalleryImage'
  accepts_nested_attributes_for :gallery_images
end
