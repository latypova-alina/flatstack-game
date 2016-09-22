FactoryGirl.define do
  factory :player_answer do
    user
    question
    answer_variant
    truthy { Faker::Boolean.boolean }
  end
end
