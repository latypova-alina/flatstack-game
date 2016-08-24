class GamesController < ApplicationController
  before_action :authenticate_user!
  expose(:games) { games_fetcher }

  def index
  end

  def new
  end

  def create
    game = Game.new state: :waiting_for_second_player,
                    first_player: current_user

    game.second_player = User.bots.random.first if params[:type] == "bot"

    game.state = :in_progress if game.both_players?

    game.save

    respond_with game
  end

  private

  def games_fetcher
    Game.includes(:first_player)
        .includes(:second_player)
        .where("first_player_id = ? OR second_player_id = ?", current_user.id, current_user.id)
  end
end
