class GamesController < ApplicationController
  before_action :authenticate_user!

  expose(:game)
  expose(:games) { current_user.games }

  def index
    @games_statistic = UserGamesStatistic.new(current_user).games
  end

  def new
  end

  def create
    result = Games::BuildGame.call(type: params[:type], current_user: current_user)
    if result.failure?
      flash[:error] = result.message
      redirect_to root_path
    else
      redirect_to edit_round_path(result.game.current_round)
    end
  end
end
