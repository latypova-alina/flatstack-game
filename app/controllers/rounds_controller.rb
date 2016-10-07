class RoundsController < ApplicationController
  expose(:categories) { Category.order("RANDOM()").limit(3) }
  expose(:round, attributes: :round_params)
  expose(:game)

  def create
  end

  def show
  end

  def edit
  end

  def update
    round.save

    create_rounds

    round.current_round_question = round.round_questions.first
    round.save

    redirect_to new_round_question_player_answer_path(round.current_round_question)
  end

  private

  def round_params
    params.require(:round).permit(:category_id)
  end

  def create_rounds
    3.times do |n|
      round.round_questions.create(question: round.category.random_question, index: n + 1)
    end
  end
end
