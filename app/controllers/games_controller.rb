class GamesController < ApplicationController
  before_action :authenticate_user!
  expose(:games) { games_fetcher }
  expose(:game)

  def index
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
        .includes(rounds: [round_questions: %i(first_player_answer_id second_player_answer_id)])
        .where("first_player_id = ? OR second_player_id = ?", current_user.id, current_user.id)
  end

  def correct_answers
    score = 0
    games.each do |game|
      next if game.first_player != current_user && game.second_player != current_user

      g_score = game_score(game)
      if game.first_player == current_user
        score += g_score[:first]
      else
        score += g_score[:second]
      end
    end
    score
  end

  def victory
    victory = 0
    games.each do |game|
      victory += 1 if game.winner_id == current_user.id
    end
    victory
  end

  def defeat
    defeat = 0
    games.each do |game|
      next if game.state != "finished" && (game.first_player != current_user || game.second_player != current_user)
      defeat += 1 if game.winner_id != current_user.id
    end
    defeat
  end

  def game_score(game)
    first_player_score = 0
    second_player_score = 0
    game.rounds.each do |round|
      round.round_questions.each do |round_question|
        answer = Answer.find_or_create_by id: round_question.first_player_answer_id
        first_player_score += 1 if answer.truthy
        answer = Answer.find_or_create_by id: round_question.second_player_answer_id
        second_player_score += 1 if answer.truthy
      end
    end
    { first: first_player_score, second: second_player_score }
  end
end
