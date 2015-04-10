# Uploader for the gallery image.
#
# @author Matthew Rayner
# @since 0.1
class GalleryImageUploader < BaseImageUploader
  version :gallery_retina do
    process resize_to_fill: [1920, 1080]
  end

  version :gallery, from_version: :gallery_retina do
    process resize_to_fill: [960, 540]
  end
end
