class User < ApplicationRecord
  has_many :gists, dependent: :destroy

  devise :rememberable, :omniauthable, omniauth_providers: %i[github]
end
