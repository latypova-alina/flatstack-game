class Game < ActiveRecord::Base
  has_many :rounds
  validates :player_1, presence: true
  validates :state, inclusion: { in: %w(search started finished) }

  before_save do
    self.state = 'search'
    self.player_1 = current_user.id
  end
end
