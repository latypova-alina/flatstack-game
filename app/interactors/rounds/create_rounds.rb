module Rounds
  class CreateRounds
    include Interactor

    delegate :game, to: :context

    def call
      create_rounds
    end

    private

    def create_rounds
      3.times do
        game.rounds.create || context.fail!
      end
      context.game = game if context.success?
    end
  end
end
