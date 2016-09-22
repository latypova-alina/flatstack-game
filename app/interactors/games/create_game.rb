module Games
  class CreateGame
    include Interactor

    delegate :user, :type, :game, to: :context

    def call
      create_game
    end

    private

    def create_game
      game = Game.new state: :waiting_for_second_player, first_player: user
      search_for_second_player(game)
    end

    def search_for_second_player(game)
      if type == "bot"
        game.second_player = User.bots.random.first
        game.current_player = user
      end
      context.game = game if context.success?
    end
  end
end
