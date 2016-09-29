require "rails_helper"

describe Rounds::CreateRounds do
  describe ".call" do
    let!(:game) { create :game, rounds: [] }
    subject(:result) { described_class.call(game: game).game.rounds }

    it { expect(result.size).to eq(3) }
  end
end
