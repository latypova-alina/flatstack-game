FactoryGirl.define do
  factory :game do
    association :first_player, factory: :user
    association :second_player, factory: :user
    state "in_progress"
    first_player User.first || create(:user)
    second_player nil
    state "waiting_for_second_player"
  end

  trait :in_progress do
    state "in_progress"
  end

  trait :finished do
    state "finished"
  end
end
