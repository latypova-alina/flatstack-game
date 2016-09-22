class AnswerVariant < ActiveRecord::Base
  belongs_to :question

  belongs_to :round_question
end
