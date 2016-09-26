class GamesController < ApplicationController
  before_action :authenticate_user!

  expose(:game)
  expose(:games) { current_user.games }
  expose(:player_answers)

  def index
    @finished_games = games.finished
    @current_games = games.where.not(state: "finished")
    @correct_answers = correct_answers
    @victories = victories
    @losses = losses
  end

  def new
  end

  def create
    result = Games::BuildGame.call(type: params[:type], current_user: current_user)
    if result.failure?
      flash[:error] = result.message
      redirect_to root_path
    else
      respond_with result.game.current_round
    end
  end

  def finished_games
    games.finished.count
  end

  def current_games
    games.where.not(state: "finished").count
  end

  def correct_answers
    current_user.player_answers.where(truthy: true).count
  end

  def victories
    games.where(winner: current_user).count
  end

  def losses
    games.finished.where.not(winner: current_user).count
  end
end
