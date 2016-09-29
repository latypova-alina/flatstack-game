require "rails_helper"

describe Games::CreateGame do
  let!(:current_user) { create :user }

  describe ".call" do
    context "game with bot" do
      let!(:bot) { create :user, :bot }
      subject(:result) { described_class.call(type: "bot", current_user: current_user).game }

      it { expect(User.bots.to_a).to include(result.second_player) }
      it { expect(result.first_player).to be(current_user) }
    end

    context "game with real player" do
      let!(:another_player) { create :user }
      let!(:game) { create :game, first_player: another_player, second_player: nil }
      subject!(:result) { described_class.call(current_user: current_user).game }

      it { expect([result.first_player, result.second_player]).to include(current_user, another_player) }
    end
  end
end
