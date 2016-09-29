require "rails_helper"

describe Rounds::CreateRounds do
  describe ".call" do
    let!(:game) { create :game, rounds: [] }
    subject(:rounds) { described_class.call(game: game).game.rounds }

    it "creates new game with 3 rounds" do
      expect(rounds.size).to eq(3)
    end
  end
end
