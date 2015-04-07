class CaseStudyGalleryImage < ActiveRecord::Base
  validates :image, presence: true
  validates_length_of :title, maximum: 255

  mount_uploader :image, GalleryImageUploader

  belongs_to :case_study
end