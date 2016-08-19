class Game < ActiveRecord::Base
  has_many :rounds, dependent: :destroy

  belongs_to :user, foreign_key: "player_1"

  validates :player_1, presence: true

  def build_rounds
    3.times { rounds << rounds.create }
  end
end
