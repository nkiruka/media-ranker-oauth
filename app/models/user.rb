class User < ApplicationRecord
  has_many :votes
  has_many :ranked_works, through: :votes, source: :work

  validates :username, uniqueness: true, presence: true

  def self.from_auth_hash(provider, auth_hash)
    user = new #can say new, because currently inside of Capital U user, find it on the current class
    user.provider = provider
    user.uid = auth_hash['uid']
    user.name = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    user.username = auth_hash['info']['nickname']

    # user.save ##controller
    return user
  end
end
