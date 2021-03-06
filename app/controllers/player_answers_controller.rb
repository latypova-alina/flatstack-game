class PlayerAnswersController < ApplicationController
  expose(:round_question)
  expose(:player_answer)
  expose(:answer_variant)
  expose(:answer_variants) { fetch_answer_variants }

  def new
  end

  def create
    initialize_player_answer

    increment_round if player_answer.save

    redirect_to new_round_question_player_answer_path(round_question.round.current_round_question)
  end

  private

  def fetch_answer_variants
    round_question.question.answer_variants.order("RANDOM()")
  end

  def initialize_player_answer
    player_answer.user = current_user
    player_answer.answer_variant = answer_variant
    player_answer.truthy = answer_variant.truthy
    player_answer.game = round_question.round.game
    player_answer.question = round_question.question
  end

  def increment_round
    round = round_question.round
    round.current_round_question = round.round_questions.find_by index: round_question.index + 1
  end
end
