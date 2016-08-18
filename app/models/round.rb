class Round < ActiveRecord::Base
  belongs_to :game
  has_many :round_question
  has_many :questions, through: :round_question

  def questions_count
    errors.add(:round, "must have 4 questions") if questions.count != 4
  end
end
