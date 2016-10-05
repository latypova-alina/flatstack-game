module Rounds
  class CreateRounds
    include Interactor

    delegate :game, to: :context

    def call
      create_rounds
    end

    private

    def create_rounds
      index = 1
      3.times do
        game.rounds.create index: index
        index += 1
      end
      game.current_round = game.rounds.first
      game.save
    end
  end
end
