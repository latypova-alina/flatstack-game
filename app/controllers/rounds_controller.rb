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

    index = 1
    3.times do
      round.round_questions.create(question: round.category.questions.order("RANDOM()").first, index: index)
      index += 1
    end

    round.current_round_question = round.round_questions.first
    round.save

    redirect_to new_round_question_player_answer_path(round.current_round_question)
  end

  private

  def round_params
    params.require(:round).permit(:category_id)
  end
end
