class Game < ActiveRecord::Base
  has_many :rounds, dependent: :destroy
  belongs_to :current_round, class_name: "Round", foreign_key: "current_round_id"
  belongs_to :current_player, class_name: "User", foreign_key: "current_player_id"

  belongs_to :first_player, class_name: "User", foreign_key: "first_player_id"
  belongs_to :second_player, class_name: "User", foreign_key: "second_player_id"

  enum state: {
    waiting_for_second_player: "waiting_for_second_player",
    in_progress: "in_progress",
    finished: "finished"
  }

  def both_players?
    first_player && second_player
  end
end
