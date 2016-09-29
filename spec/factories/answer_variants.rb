FactoryGirl.define do
  factory :answer_variant do
    answer { generate(:answer) }
    question
    truthy { Faker::Boolean.boolean }
  end
end
