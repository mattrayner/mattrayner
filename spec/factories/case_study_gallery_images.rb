FactoryGirl.define do
  factory :case_study_gallery_image do
    title 'Give Cat - The javascript bookmarklet'

    file = File.join(Rails.root, 'spec', 'support', 'files', 'test_cat.png')
    image { Rack::Test::UploadedFile.new(file) }

    case_study
  end
end
