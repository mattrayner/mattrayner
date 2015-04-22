FactoryGirl.define do
  factory :skill do
    title 'Ruby'
    level 99.5

    svg = File.join(Rails.root, 'spec', 'support', 'files', 'ruby_logo.svg')
    svg_logo { Rack::Test::UploadedFile.new(svg) }

    png = File.join(Rails.root, 'spec', 'support', 'files', 'ruby_logo.png')
    image_logo { Rack::Test::UploadedFile.new(png) }

    factory :skill_with_case_studies do
      case_studies { [create(:case_study), create(:case_study)] }
    end
  end
end
