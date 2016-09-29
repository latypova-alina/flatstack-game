require "rails_helper"

describe Questions::CreateRoundsQuestions do
  let!(:game) { create :game }

  describe ".call" do
    subject(:result) { described_class.call(game: game) }
    it do
      result.game.rounds.each do |r|
        expect(r.round_questions.size).to eq(3)
      end
    end
  end
end
