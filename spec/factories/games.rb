FactoryGirl.define do
  factory :game do
    association :first_player, factory: :user
    association :second_player, factory: :user
    state "in_progress"
  end

  trait :in_progress do
    state "in_progress"
  end

  trait :finished do
    state "finished"
  end
end
