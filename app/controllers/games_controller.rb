class GamesController < ApplicationController
  before_action :authenticate_user!
  expose(:games) { games_fetcher }
  expose(:game)

  def index
  end

  def new
  end

  def create
    result = Games::BuildGame.call(type: params[:type], user: current_user, game: game)
    respond_with game
    flash[:notice] = result.message if result.failure?
  end

  private

  def games_fetcher
    Game.includes(:first_player)
        .includes(:second_player)
        .where("first_player_id = ? OR second_player_id = ?", current_user.id, current_user.id)
  end
end
