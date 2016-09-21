class RoundQuestion < ActiveRecord::Base
  belongs_to :round
  belongs_to :question

  belongs_to :first_player_answer_id, class_name: "Answer", foreign_key: "first_player_answer_id"
  belongs_to :second_player_answer_id, class_name: "Answer", foreign_key: "second_player_answer_id"

  validates :round_id, :question_id, presence: true
end
