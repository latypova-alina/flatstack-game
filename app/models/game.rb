class Game < ActiveRecord::Base
  has_many :rounds
  validates :player_1, presence: true
  validates :state, inclusion: { in: %w(search started finished) }
  validates :rounds, length: { is: 3, message: "game must have 3 rounds" }
end
