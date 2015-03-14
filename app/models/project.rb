class Project < ActiveRecord::Base
  validates :title, :body, presence: true
  validates_length_of :title, maximum: 255

  mount_uploader :header_image, HeaderUploader
end
