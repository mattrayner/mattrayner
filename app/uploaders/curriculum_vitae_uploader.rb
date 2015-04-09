# CurriculumVitae Uploader class, allowing the user to upload a single PDF file to be made available on the front-end
#
# @author Matthew Rayner
# @since 0.1
class CurriculumVitaeUploader < CarrierWave::Uploader::Base
  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    ['pdf']
  end
end