FactoryGirl.define do
  factory :answer do
    answer { generate(:answer) }
    question
    truthy { Faker::Boolean.boolean }
  end
end
