FactoryGirl.define do
  factory :game do
    id 1
    first_player_id 1
    second_player_id nil
    state "waiting_for_second_player"

    before(:create) do
      create(:user, id: 1)
      create(:round, game_id: 1)
      create(:round, game_id: 1)
      create(:round, game_id: 1)
    end
  end
end
