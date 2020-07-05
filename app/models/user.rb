class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:linkedin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.token = auth.credentials.token
      user.name = auth.info.first_name
      user.image = auth.info.picture_url
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
end
