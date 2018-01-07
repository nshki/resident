class User < ApplicationRecord
  include Clearance::User

  has_many :issues, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :community

  validates :code, presence: true

  def gravatar_url
    "//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}"
  end
end
