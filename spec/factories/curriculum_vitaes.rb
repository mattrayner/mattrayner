FactoryGirl.define do
  factory :curriculum_vitae do
    note 'Test CV'

    file = File.join(Rails.root, 'spec', 'support', 'files', 'test_pdf.pdf')
    file { Rack::Test::UploadedFile.new(file) }
  end
end
