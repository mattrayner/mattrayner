FactoryGirl.define do
  factory :case_study do
    title 'Give Cat'
    intro 'A bookmarklet to replace all the images on a web page with cats!'
    body  'Inspired by [http://heygirl.io/](Hey Girl) - build with Javascript and PHP.'
    header_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test_cat.png')) }

    factory :case_study_with_gallery_images do
      transient do
        images_count 5
      end

      after :create do |case_study, evaluator|
        create_list(:case_study_gallery_image, evaluator.images_count, case_study: case_study)
      end
    end
  end
end
