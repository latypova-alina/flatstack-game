class GamesController < ApplicationController
  before_action :authenticate_user!

  expose(:game)
  expose(:games) { games_fetcher }
  expose(:player_answers)

  def index
    @finished_games = finished_games
    @current_games = current_games
    @current_user_score = correct_answers
    @victory = victory
    @defeat = defeat
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

  def finished_games
    games.where(state: "finished").count
  end

  def current_games
    games.where.not(state: "finished").count
  end

  def correct_answers
    current_user.player_answers.where(truthy: TRUE).count
  end

  def victory
    games.where(winner_id: current_user.id).count
  end

  def defeat
    games.where(state: "finished").where.not(winner_id: current_user.id).count
  end
end
