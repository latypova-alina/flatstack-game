class Game < ActiveRecord::Base
  # has_many :rounds
  validates :player_1, presence: true
  validates :state, inclusion: { in: %w(search started finished) }
end
