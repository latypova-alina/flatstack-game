module Rounds
  class CreateRounds
    include Interactor

    delegate :game, to: :context

    def call
      create_rounds
    end

    private

    def create_rounds
      3.times do |n|
        game.rounds.create index: n+1
      end

      game.current_round = game.rounds.first
      game.save
    end
  end
end
