class User < ApplicationRecord
  include Clearance::User

  belongs_to :community

  validates :code, presence: true
end
