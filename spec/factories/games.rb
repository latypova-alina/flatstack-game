FactoryGirl.define do
  factory :game do
    association :first_player, factory: :user
    association :second_player, factory: :user
    state "in_progress"
  end
end
