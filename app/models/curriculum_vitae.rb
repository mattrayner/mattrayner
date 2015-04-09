class CurriculumVitae < ActiveRecord::Base
  validates :file, presence: { message: 'File is required.' }

  mount_uploader :file, CurriculumVitaeUploader
end
