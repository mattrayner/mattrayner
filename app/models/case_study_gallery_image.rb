# @author Matthew Rayner
# @since 0.1
class CaseStudyGalleryImage < ActiveRecord::Base
  validates :image,
            presence: {
              message: I18n.t('.case_study_gallery_image.image_validation')
            }
  validates_length_of :title, maximum: 255

  mount_uploader :image, GalleryImageUploader

  belongs_to :case_study
end
