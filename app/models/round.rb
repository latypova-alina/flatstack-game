class Round < ActiveRecord::Base
  belongs_to :game
  has_many :round_questions, dependent: :destroy
  validates :game_id, presence: true
  after_create do
    4.times do
      round_questions.create(question_id: 1, round_id: id)
    end
  end
end
