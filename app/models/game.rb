class Game < ActiveRecord::Base
  has_many :rounds, dependent: :destroy
  validates :player_1, presence: true
  validates :state, inclusion: { in: %w(search started finished) }

  after_create do
    3.times do
      rounds.create
    end
  end
end
