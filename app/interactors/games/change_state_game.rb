module Games
  class ChangeStateGame
    include Interactor

    delegate :game, to: :context

    def call
      change_state
    end

    private

    def change_state
      game.state = game.both_players? ? :in_progress : :waiting_for_second_player
      game.save || context.fail!
    end
  end
end
