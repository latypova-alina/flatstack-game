class AnswerVariant < ActiveRecord::Base
  belongs_to :question
  belongs_to :round_question

  has_many :player_answers
end
