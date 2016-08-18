FactoryGirl.define do
  factory :game do
    id 1
    player_1 1
    player_2 nil
    state "search"
    before(:create) do
      create(:user, id: 1)
      create(:round, game_id: 1)
      create(:round, game_id: 1)
      create(:round, game_id: 1)
    end
  end
end
