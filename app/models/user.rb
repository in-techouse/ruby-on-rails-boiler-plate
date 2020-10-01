class User < ApplicationRecord
  extend Devise::Models

  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_one_attached :image

  ############Omniauth with Facebook##################

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

end
