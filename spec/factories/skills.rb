FactoryGirl.define do
  factory :skill do
    title 'Ruby'
    level 99.5

    factory :skill_with_case_studies do
      case_studies {[create(:case_study), create(:case_study)]}
    end
  end
end
