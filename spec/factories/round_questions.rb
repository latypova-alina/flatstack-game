FactoryGirl.define do
  factory :round_question do
    round
    question
    association :first_player_answer, factory: :answer
    association :second_player_answer, factory: :answer
  end
end
