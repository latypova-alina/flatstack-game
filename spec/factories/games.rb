FactoryGirl.define do
  factory :game do
    id 1
    first_player 1
    second_player nil
    state "waiting_for_second_player"

    before(:create) do
      create(:user, id: 1)
      create(:round, game_id: 1)
      create(:round, game_id: 1)
      create(:round, game_id: 1)
    end
  end
end
