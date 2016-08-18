class RoundQuestion < ActiveRecord::Base
  belongs_to :round
  validates :round_id, presence: true
  validates :question_id, presence: true
end
