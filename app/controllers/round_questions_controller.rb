class RoundQuestionsController < ApplicationController
  expose(:round_question)
  expose(:answer_variants) { fetch_answer_variants }

  def show
  end

  def edit
  end

  private

  def fetch_answer_variants
    round_question.question.answer_variants.order("RANDOM()")
  end
end
