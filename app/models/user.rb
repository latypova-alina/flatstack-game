class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :vkontakte, :google_oauth2]

  validates :full_name, presence: true

  has_many :games, dependent: :destroy, foreign_key: "player_1"
  enum role: { user: "user", administrator: "administrator" }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.provider == "vkontakte"
      	user.email = auth.uid + "@vk.com"
      else
      	user.email = auth.info.email
      end
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.oauth_data"] &&  session["devise.oauth_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
