module Games
  class ChangeStateGame
    include Interactor

    delegate :game, to: :context

    def call
      change_state
    end

    private

    def change_state
      game.state = :in_progress if game.both_players?
      game.save || context.fail!
    end
  end
end
