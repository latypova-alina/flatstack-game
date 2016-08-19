class Round < ActiveRecord::Base
  belongs_to :game

  has_many :round_questions, dependent: :destroy
  has_many :questions, through: :round_question

  after_create do
    4.times do
      round_questions.create(question_id: 1, round_id: id)
    end
  end

  def questions_count
    errors.add(:round, "must have 4 questions") if questions.count != 4
  end
end
