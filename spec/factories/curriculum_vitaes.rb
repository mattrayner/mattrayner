FactoryGirl.define do
  factory :curriculum_vitae do
    note 'Test CV'
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test_pdf.pdf')) }
  end
end
