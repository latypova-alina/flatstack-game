class Game < ActiveRecord::Base
  has_many :rounds, dependent: :destroy
  belongs_to :user, foreign_key: "player_1"
  validates :player_1, presence: true
  validates :state, inclusion: { in: %w(search started finished) }
  validates :rounds, length: { is: 3, message: "game must have 3 rounds" }

  after_create do
    3.times do
      rounds.create
    end
  end
end
