class User < ApplicationRecord
  include Clearance::User

  belongs_to :community

  validates :code, presence: true

  def gravatar_url
    "//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}"
  end
end
