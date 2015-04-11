# Uploader for a case studies' header image
#
# @author Matthew Rayner
# @since 0.1
class HeaderUploader < BaseImageUploader
  version :retina_banner do
    process resize_to_fill: [2400, 760]
  end

  version :banner, from_version: :retina_banner do
    process resize_to_fill: [1200, 380]
  end
end
