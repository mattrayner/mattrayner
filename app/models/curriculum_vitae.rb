# @author Matthew Rayner
# @since 0.1
class CurriculumVitae < ActiveRecord::Base
  validates :file,
            presence: {
              message: I18n.t('.curriculum_vitae.file_validation')
            }

  mount_uploader :file, CurriculumVitaeUploader
end
