FactoryGirl.define do
  factory :game do
    association :first_player, factory: :user
    association :second_player, factory: :user
    state "in_progress"
  end

  trait :waiting_for_second_player do
    state "waiting_for_second_player"
    second_player nil
  end

  trait :finished do
    state "finished"
  end
end
