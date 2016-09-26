class User < ActiveRecord::Base
  devise :database_authenticatable,
    :registerable,
    :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    omniauth_providers: %i(facebook vkontakte google_oauth2)

  validates :full_name, presence: true

  scope :bots, -> { where role: "bot" }
  scope :random, -> { order("RANDOM()") }

  enum role: {
    bot: "bot",
    user: "user",
    administrator: "administrator"
  }

  def games
    Game.includes(:first_player)
        .includes(:second_player)
        .where("first_player_id = ? OR second_player_id = ?", id, id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = if auth.provider == "vkontakte"
        auth.uid + "@vk.com"
      else
        auth.info.email
      end
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      data = session["devise.oauth_data"]
      if data && session["devise.oauth_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
