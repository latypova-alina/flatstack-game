class Round < ActiveRecord::Base
  belongs_to :game
  has_many :round_questions, dependent: :destroy

  after_create do
    4.times do
      round_questions.create
    end
  end
end
