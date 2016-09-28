class AnswerVariant < ActiveRecord::Base
  validates :answer, presence: true

  belongs_to :question
  belongs_to :round_question

  has_many :player_answers
end
