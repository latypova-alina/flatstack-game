require "rails_helper"

describe UserGamesStatistic do
  let!(:user) { create :user }
  let!(:first_game) { create :game, first_player: user }
  let!(:second_game) { create :game, first_player: user, state: "finished", winner_id: user.id }
  let!(:statistic) { described_class.new(user).games }

  it "returns right finished games number" do
    expect(statistic[:finished].size).to eq(1)
  end

  it "returns right current games number" do
    expect(statistic[:current].size).to eq(1)
  end

  it "returns right correct answer number" do
    expect(statistic[:correct_answers]).to eq(0)
  end

  it "returns right failed games number" do
    expect(statistic[:failed]).to eq(0)
  end

  it "returns right won games number" do
    expect(statistic[:won]).to eq(1)
  end
end
