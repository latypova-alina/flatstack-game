class RoundQuestion < ActiveRecord::Base
  belongs_to :round
  belongs_to :question

  validates :round_id, :question_id, presence: true
end
