FactoryGirl.define do
  factory :player_answer do
    user
    game
    question
    answer_variant
    truthy { Faker::Boolean.boolean }
  end
end
