class Project < ActiveRecord::Base
  validates :title, :body, presence: true
  validates_length_of :title, maximum: 255

  mount_uploader :header_image, HeaderUploader

  has_many :gallery_images, :foreign_key => 'project_id', :class_name => 'ProjectGalleryImage'
  accepts_nested_attributes_for :gallery_images
end
