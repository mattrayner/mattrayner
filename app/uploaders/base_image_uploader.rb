# Base Image Uploader class, containing a number of attributes shared among the
# uploaders within the app.
# Contains a number of defaults including, but not limited to:
#   Storage location
#   Default images
#   Accepted extensions
#
# @author Matthew Rayner
# @since 0.1
class BaseImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    '/images/fallback/' + [version_name, 'default.png'].compact.join('_')
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [50, 50]
  end
end
