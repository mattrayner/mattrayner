FactoryGirl.define do
  factory :case_study_gallery_image do
    title 'Give Cat - The javascript bookmarklet'
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test_cat.png')) }
    case_study
  end
end
