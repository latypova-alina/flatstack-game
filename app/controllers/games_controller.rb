class GamesController < ApplicationController
  before_action :authenticate_user!

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
    games.where("state='finished' AND (first_player_id=:id OR second_player_id = :id)", id: current_user.id)
  end

  def current_games
    games.where("state!='finished' AND (first_player_id=:id OR second_player_id = :id)", id: current_user.id)
  end

  def correct_answers
    player_answers.where(user_id: current_user, truthy: TRUE).count
  end

  def victory
    games.where(winner_id: current_user.id).count
  end

  def defeat
    games.where("state='finished' AND winner_id!=:id AND (first_player_id=:id OR second_player_id = :id)",
      id: current_user.id).count
  end
end
