require "rails_helper"

describe Games::ChangeStateGame do
  describe ".call" do
    let!(:current_user) { create :user }
    context "game with both players" do
      let!(:second_player) { create :user }
      let(:game) { create :game, first_player: current_user, second_player: second_player }
      subject(:result) { described_class.call(game: game).game }

      it { expect(result.state).to eq("in_progress") }
    end

    context "game with one player" do
      let(:game) { create :game, :waiting_for_second_player, first_player: current_user }
      subject(:result) { described_class.call(game: game).game }

      it { expect(result.state).to eq("waiting_for_second_player") }
    end
  end
end
