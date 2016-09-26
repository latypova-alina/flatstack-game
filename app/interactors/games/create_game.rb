module Games
  class CreateGame
    include Interactor

    delegate :current_user, :type, :game, to: :context

    def call
      if type == "bot"
        create_game_with_bot
      else
        create_game_with_player
      end
    end

    def create_game_with_bot
      context.game = Game.new first_player: current_user
      game.second_player = User.bots.random.first
    end

    def create_game_with_player
      context.game = Game.waiting_for_second_player.first || Game.new
      game.persisted? ? game.second_player = current_user : game.first_player = current_user
    end
  end
end
