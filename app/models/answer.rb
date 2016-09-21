class Answer < ActiveRecord::Base
  belongs_to :question

  has_many :first_player_answer_id, class_name: "RoundQuestion", foreign_key: "first_player_answer_id"
  has_many :second_player_answer_id, class_name: "RoundQuestion", foreign_key: "second_player_answer_id"
end
