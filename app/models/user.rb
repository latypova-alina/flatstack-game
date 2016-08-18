class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :games, dependent: :destroy, foreign_key: "player_1"
  enum role: { user: "user", administrator: "administrator" }
end
