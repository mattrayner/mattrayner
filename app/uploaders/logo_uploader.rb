# Logo Uploader class, used by Skills to display a pretty logo for each skill
#
# @author Matthew Rayner
# @since 0.2
class LogoUploader < BaseImageUploader
  version :standard do
    process resize_to_fill: [150, 150]
  end
end
